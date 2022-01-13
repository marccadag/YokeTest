//
//  Genre.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/13/22.
//

import Foundation

struct Genre: Codable, Identifiable {
    let id: String
    let name: Name
    
    enum Name: String, Codable {
        case alternative = "Alternative"
        case children = "Children's Music"
        case classical = "Classical"
        case country = "Country"
        case hipHopRap = "Hip-Hop/Rap"
        case latin = "Latin"
        case music = "Music"
        case pop = "Pop"
        case rbSoul = "R&B/Soul"
        case rock = "Rock"
        case soundtrack = "Soundtrack"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "genreId"
        case name
    }
}
