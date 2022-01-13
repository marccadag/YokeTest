//
//  AlbumsListView.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/12/22.
//

import SwiftUI

struct AlbumsListView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        mainView
            .navigationTitle("Albums")
            .sheet(item: $viewModel.selectedAlbum, onDismiss: nil) { album in
                AlbumDetailView(album: album, copyright: viewModel.copyright)
            }
            .alert(viewModel.errorMessage ?? "Error occurred", isPresented: $viewModel.hasError, actions: {})
            .onAppear {
                viewModel.fetchAlbums()
            }
    }
    
    var mainView: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                listView
            }
        }
    }
    
    var listView: some View {
        List(viewModel.albums) { album in
            AlbumRowView(album: album)
                .onTapGesture {
                    viewModel.selectAlbum(album)
                }
        }
    }
}
