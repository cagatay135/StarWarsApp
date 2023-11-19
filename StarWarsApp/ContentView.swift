//
//  ContentView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var movieViewModel = MovieViewModel()
        
    var body: some View {
        NavigationView {
                if movieViewModel.movies != nil {
                    List(movieViewModel.movies!, id: \.title) { movie in
                        NavigationLink(destination: DetailView(movie: movie)) {
                            Text(movie.title)
                        }
                    }
                    .navigationBarTitle("Star Wars Movies")
                } else {
                    LoadingView()
                }
        }
        .onAppear {
            movieViewModel.getFilms()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
