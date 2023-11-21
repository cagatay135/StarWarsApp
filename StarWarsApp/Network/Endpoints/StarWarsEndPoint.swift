//
//  StarWarsEndPoint.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 16.11.2023.
//

import Foundation

enum StarWarsEndPoint {
    case getFilms
    case getFilm(id: Int)
}

extension StarWarsEndPoint: Endpoint {
    var path: String {
        switch self {
        case .getFilms:
            return "/api/films"
        case .getFilm(let id):
            return "/api/films/\(id)"
        }
    }
    var method: RequestMethod {
        switch self {
        case .getFilms, .getFilm:
            return .get
        }
    }
    var body: [String: String]? {
        switch self {
        case .getFilms, .getFilm:
            return nil
        }
    }
    var header: [String : String]? {
        switch self {
        case .getFilms, .getFilm:
            return nil
        }
    }
}
