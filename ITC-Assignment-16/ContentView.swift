//
//  ContentView.swift
//  ITC-Assignment-16
//
//  Created by Isaiah Ojo on 24/04/2023.
//
import SwiftUI

struct ContentView: View {
    // Create an instance of the PokemonListViewModel
    @StateObject var viewModel = PokemonViewModel(manager: NetworkManager())

    var body: some View {
        PokemonListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
