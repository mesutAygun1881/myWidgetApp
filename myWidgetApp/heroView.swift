//
//  heroView.swift
//  myWidgetApp
//
//  Created by mesutAygun on 1.04.2021.
//

import SwiftUI

struct heroView: View {
    let hero : Superhero
    var body: some View {
        HStack{
            CircleImage(image: Image(hero.image)).frame(width: 100, height: 100, alignment: .center).padding().padding().padding()
           
            
            VStack{
    
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                
                Text(hero.realName)
                    .fontWeight(.bold)
            }.padding()
            Spacer()
    
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
struct heroView_Previews: PreviewProvider {
    static var previews: some View {
        heroView(hero: ali)
    }
}
    
