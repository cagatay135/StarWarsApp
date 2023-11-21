//
//  StarWarsService.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 15.11.2023.
//

import Foundation

protocol StarWarsServiceProtocol {
    func getFilms(endPoint: StarWarsEndPoint, completion: @escaping (Result<Movies, NetworkError>) -> Void)
    func getFilm(endPoint: StarWarsEndPoint, completion: @escaping (Result<Movie, NetworkError>) -> Void)
}

final class StarWarsService: StarWarsServiceProtocol {
    private let service: ServiceProtocol
    init(service: ServiceProtocol) {
        self.service = service
    }

    func getFilms(endPoint: StarWarsEndPoint, completion: @escaping (Result<Movies, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<Movies, NetworkError>) in
            completion(result)
        }
    }
    func getFilm(endPoint: StarWarsEndPoint, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<Movie, NetworkError>) in
            completion(result)
        }
    }

}
