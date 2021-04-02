//
//  widgetHero.swift
//  widgetHero
//
//  Created by mesutAygun on 3.04.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.mesutaygun.myWidgetApp"))
    var heroData : Data = Data()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Superhero(image: "ali", name: "ali", realName: "alico"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
            if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
                let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
                let timeline = Timeline(entries: [entry], policy: .never)
                completion(timeline)
            
    }
}
}
struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero : Superhero
}

struct widgetHeroEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircleImage(image: Image(entry.hero.image))
    }
}

@main
struct widgetHero: Widget {
    let kind: String = "widgetHero"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            widgetHeroEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

