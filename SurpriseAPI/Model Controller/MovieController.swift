//
//  MovieController.swift
//  SurpriseAPI
//
//  Created by Kyle Jennings on 11/21/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import Foundation

class MovieController {
    
    static func fetchMovie(searchText: String, completion: @escaping (Result<Movie, MovieAPIError>) -> Void) {
        guard let baseURL = URL(string: "http://www.omdbapi.com") else {return completion(.failure(.invalidURL))}
        let queryItemAPIKey = URLQueryItem(name: "apikey", value: "5d7fb47a")
        let queryItemTitle = URLQueryItem(name: "t", value: searchText)
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [queryItemAPIKey, queryItemTitle]
        
        guard let url = urlComponents?.url else {return completion(.failure(.invalidURL))}
        
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                completion(.failure(.communicationError))
            }
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let movie = try JSONDecoder().decode(Movie.self, from: data)
                print(movie)
                completion(.success(movie))
            } catch {
                print(error)
                completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}

enum MovieAPIError: LocalizedError {
    case invalidURL
    case communicationError
    case noData
    case unableToDecode
}
