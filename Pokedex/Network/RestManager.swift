//
//  RestManager.swift
//  Pokedex
//
//  Created by Felipe Domingos on 04/10/22.
//

import Foundation
import Alamofire

class RestManager {
    func validatepokemon(url: String, name: String, completion: @escaping (_ register: Register) -> Void) {
        AF.request("\(url)/pokemon/\(name)", method: .get).response { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                guard let userData = try? decoder.decode(Register.self, from: data) else { return }
                completion(userData)
            } else {
                print(response.error as Any, "DEU ERRO")
            }
        }
    }
}
