//
//  AlbumManager.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/12/22.
//

import Foundation

protocol AlbumManagerDelegate: AnyObject {
    func didFetchAlbums(_ albumManager: AlbumManager, albums: [Album], copyright: String)
    func didFail(_ albumManager: AlbumManager, error: Error)
}

class AlbumManager: NetworkManager {
    weak var delegate: AlbumManagerDelegate?
    
    private let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
    
    func fetchAlbums() {
        fetchData(urlString: urlString, AlbumData.self) { [weak self] albumData in
            guard let self = self else { return }
            
            self.delegate?.didFetchAlbums(self, albums: albumData.feed.albums, copyright: albumData.feed.copyright)
        } onError: { [weak self] error in
            guard let self = self else { return }
            
            self.delegate?.didFail(self, error: error)
        }
    }
}
