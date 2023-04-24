//
//  PokemonViewModel.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//

import Foundation

class PokemonViewModel:ObservableObject {
    
    @Published var pokemonList = [Pokemon]()
}
