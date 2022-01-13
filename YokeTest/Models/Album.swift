//
//  Album.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/12/22.
//

import Foundation

struct AlbumData: Codable {
    let feed: Feed
    
    struct Feed: Codable {
        let copyright: String
        let albums: [Album]
        
        enum CodingKeys: String, CodingKey {
            case albums = "results"
            case copyright
        }
    }
}

struct Album: Codable, Identifiable {
    let id: String
    let name: String
    let artistName: String
    let thumbnailURL: String
    let genres: [Genre]
    let releaseDate: String
    let artistURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case artistName
        case thumbnailURL = "artworkUrl100"
        case genres
        case releaseDate
        case artistURL = "artistUrl"
    }
}


