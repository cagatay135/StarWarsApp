//
//  ContentView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MovieListView()
            .navigationTitle("Star Wars Movies")
            /*
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.black,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
             */
        }
    }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
