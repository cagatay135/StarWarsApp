//
//  Movies.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 17.11.2023.
//

import Foundation

struct Movies: Decodable {
    let count: Int
    let next, previous: String?
    let results: [Movie]
}
