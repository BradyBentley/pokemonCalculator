//
//  PokemonController.swift
//  Calculator
//
//  Created by Brady Bentley on 1/9/19.
//  Copyright © 2019 Brady. All rights reserved.
//

import UIKit

class PokemonController {
    // MARK: - Properties
    static let shared = PokemonController(); private init(){}
    let baseUrl = URL(string: "https://pokeapi.co/api/v2/pokemon")
    
    func fetchPokemonWith(nameOrId: String, completion: @escaping (Pokemon?) -> ()){
        // URL + Request(if needed)
        guard let fullUrl = baseUrl?.appendingPathComponent(nameOrId) else { completion(nil) ; return }
        //DataTask + Resume
        URLSession.shared.dataTask(with: fullUrl) { (data, _, error) in
            if let error = error {
                print("Error in fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            do {
                let pokemon =  try jsonDecoder.decode(Pokemon.self, from: data)
                completion(pokemon)
            } catch {
                print("There was an error in \(#function): \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchImage(for pokemon: Pokemon, completion: @escaping (UIImage?) -> ()) {
        //URL
        guard let url = URL(string: pokemon.sprites.imageUrl) else { completion(nil) ; return }
        //DataTask + resume
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil) ; return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    func getPokemonActualNumber(number: Int) -> Int {
        var pokemonNumber = number
        while pokemonNumber > 807 {
            if (pokemonNumber + 1) % 3 == 0{
                pokemonNumber = (pokemonNumber + 1) / 3
            } else if (pokemonNumber - 1) % 3 == 0 {
                pokemonNumber = (pokemonNumber - 1) / 3
            } else {
                pokemonNumber = pokemonNumber / 3
            }
        }
        return pokemonNumber
    }
}
