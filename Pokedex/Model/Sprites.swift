//
//  Sprites.swift
//  Pokedex
//
//  Created by Felipe Domingos on 11/10/22.
//

import Foundation

struct Sprites: Codable {
   let other: Others?
}


struct Others: Codable {
    let home: Home?
}

struct Home: Codable {
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}
