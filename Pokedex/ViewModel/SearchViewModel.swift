//
//  SearchViewModel.swift
//  Pokedex
//
//  Created by Felipe Domingos on 04/10/22.
//
import Foundation
import UIKit

class SearchViewModel {
    
    var rest = RestManager()
    
    func validatePoke(url: String, name: String, completion: @escaping (_ register: Register) -> Void) {
            rest.validatepokemon(url: url, name: name) { register in
                completion(register)
        }
    }
}
