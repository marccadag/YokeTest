//
//  AlbumsListView+ViewModel.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/13/22.
//

import Foundation

extension AlbumsListView {
    class ViewModel: ObservableObject, AlbumManagerDelegate{
        @Published var albums: [Album] = []
        @Published var copyright = ""
        @Published var isLoading = false
        @Published var selectedAlbum: Album?
        @Published var hasError = false
        
        var errorMessage: String? {
            didSet {
                hasError = errorMessage != nil
            }
        }
        
        private let albumManager = AlbumManager()
        
        init() {
            albumManager.delegate = self
        }
        
        func fetchAlbums() {
            isLoading = true
            albumManager.fetchAlbums()
        }
        
        func selectAlbum(_ album: Album) {
            selectedAlbum = album
        }
        
        func didFetchAlbums(_ albumManager: AlbumManager, albums: [Album], copyright: String) {
            DispatchQueue.main.async {
                self.isLoading = false
                self.albums = albums
                self.copyright = copyright
            }
        }
        
        func didFail(_ albumManager: AlbumManager, error: Error) {
            DispatchQueue.main.async {
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

