//
//  HttpClient.swift
//  StarWarsApp
//
//  Created by Çağatay Çürük on 16.11.2023.
//

import Foundation

protocol ServiceProtocol {
    func fetch<T: Decodable>(endPoint: Endpoint, completion: @escaping(Result<T, NetworkError>) -> Void)
}

final class Service: ServiceProtocol {
    func fetch<T: Decodable>(endPoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let components = createURLComponents(from: endPoint)
        guard let url = components.url else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.noResponse))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.unknown))
                return
            }
            switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    print("Decode error: \(error)")
                    completion(.failure(.decode))
                }
            case 401:
                completion(.failure(.unauthorized))
            default:
                completion(.failure(.unexpectedStatusCode))
            }
        }.resume()
    }
    private func createURLComponents(from endPoint: Endpoint) -> URLComponents {
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.host
        components.path = endPoint.path
        return components
    }
}
