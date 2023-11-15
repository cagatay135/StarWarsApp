//
//  RequestError.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 16.11.2023.
//

import Foundation

enum NetworkError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
