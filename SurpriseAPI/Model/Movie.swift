//
//  Movie.swift
//  SurpriseAPI
//
//  Created by Kyle Jennings on 11/21/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let title: String
    let imdbRating: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbRating
    }
}

