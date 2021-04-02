//
//  ContentView.swift
//  myWidgetApp
//
//  Created by mesutAygun on 2.04.2021.
//

import SwiftUI
import WidgetKit

let superHeroArray = [ali , deli , veli]

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.mesutaygun.myWidgetApp"))
    var heroData : Data = Data()
    
    var body: some View {
        
        VStack {
        ForEach(superHeroArray){hero in
            
            heroView(hero : hero).onTapGesture {
                savetoDefaults(hero : hero)
            }
            
        }
        }
    }
    
    func savetoDefaults (hero : Superhero) {
        
        if let heroData = try? JSONEncoder().encode(hero){
            self.heroData = heroData
            WidgetCenter.shared.reloadTimelines(ofKind: "widgetHero")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
