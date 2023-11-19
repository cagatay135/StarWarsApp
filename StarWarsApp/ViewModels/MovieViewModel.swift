//
//  MovieViewModel.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 17.11.2023.
//

import Foundation

class MovieViewModel: ObservableObject{
    @Published var movies: [Movie]?

    static let service = Service()
    private let starWarsService = StarWarsService(service: service)
    
        
    func getFilms() {
        starWarsService.getFilms(endPoint: .getFilms) { result in
            switch result {
            case .success(let movies):
                self.movies = movies.results
            case .failure(let error):
                // Hata durumunda
                print("Hata: \(error)")
            }
        }
    }
    
}
