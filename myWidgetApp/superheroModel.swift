//
//  superheroModel.swift
//  myWidgetApp
//
//  Created by mesutAygun on 1.04.2021.
//

import Foundation


struct  Superhero : Identifiable , Codable {
    
    let image : String
    let name : String
    let realName : String
    
    var id : String {image}
}

let ali = Superhero(image: "ali", name: "ali", realName: "alico")
let veli = Superhero(image: "veli", name: "veli", realName: "velico")
let deli = Superhero(image: "deli", name: "deli", realName: "delico")
