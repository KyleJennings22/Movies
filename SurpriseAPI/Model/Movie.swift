//
//  Movie.swift
//  SurpriseAPI
//
//  Created by Kyle Jennings on 11/21/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import Foundation

struct TopLevelObject: Codable {
    let rating: RatingLevel
    
    struct RatingLevel: Codable {
        let value: String
    }
}

enum CodingKeys: String, CodingKey {
    case rating = "Rating"
    case value = "Value"
}
