//
//  Album+Mock.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/13/22.
//

import Foundation

extension Album {
    static let mock = Album(
        id: "1",
        name: "Gunna",
        artistName: "DS4EVER",
        thumbnailURL: "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/03/d0/bb/03d0bbde-4315-8bbb-8880-866fc6fdef6d/810043689243.jpg/100x100bb.jpg",
        genres: [Genre(id: "1", name: .hipHopRap), Genre(id: "2", name: .music)],
        releaseDate: "2022-01-07",
        artistURL: "https://music.apple.com/us/artist/gunna/1236267297"
    )
}
