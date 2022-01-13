//
//  AlbumDetailView.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/13/22.
//

import SwiftUI

struct AlbumDetailView: View {
    enum Constants {
        static let imageSize: CGFloat = 200
    }
    
    let album: Album
    let copyright: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            headerView
            genresView
            releaseDateView
            Spacer()
            iTunesButton
        }
        .padding(20)
        
    }
    
    var headerView: some View {
        VStack(spacing: 16) {
            imageView
            copyrightView
            
            Text(album.name)
                .bold()
            Text(album.artistName)
                .italic()
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
    
    var genresView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Genres:")
                .bold()
            ForEach(album.genres) { genre in
                Text(genre.name.rawValue)
            }
        }
    }
    
    var releaseDateView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Release Date:")
                .bold()
            Text(album.releaseDate)
        }
    }
    
    var copyrightView: some View {
        Text(copyright)
            .italic()
            .foregroundColor(.gray)
            .font(.caption)
    }
    
    var imageView: some View {
        AsyncImage(url: URL(string: album.thumbnailURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(width: Constants.imageSize, height: Constants.imageSize)
        .cornerRadius(16)
    }
    
    var iTunesButton: some View {
        Group {
            if let artistUrlString = album.artistURL, let artistURL = URL(string: artistUrlString) {
                Link("See on iTunes", destination: artistURL)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(12)
            } else {
                EmptyView()
            }
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: .mock, copyright: "Copyright © 2022 Apple Inc. All rights reserved.")
    }
}
