//
//  MovieListView.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 19.11.2023.
//

import SwiftUI

struct MovieListView: View {
  @StateObject var movieViewModel = MovieViewModel()

  var body: some View {
    ZStack {
      if movieViewModel.movies != nil {
        List(movieViewModel.movies!, id: \.title) { movie in
          NavigationLink(destination: DetailView(movie: movie)) {
            Text(movie.title)
          }
        }
      } else {
        LoadingView()
      }
    }.onAppear {
      movieViewModel.getFilms()
    }
  }
}

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}
