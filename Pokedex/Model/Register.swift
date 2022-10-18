//
//  Register.swift
//  Pokedex
//
//  Created by Felipe Domingos on 04/10/22.
//

import Foundation

struct Register: Codable {
    
    let name: String?
    let id: Int?
    let sprites: Sprites?
    var types: [Types]
}
