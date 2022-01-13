//
//  AlbumRowView.swift
//  YokeTest
//
//  Created by Marc Cadag on 1/13/22.
//

import SwiftUI

struct AlbumRowView: View {
    enum Constants {
        static let rowHeight: CGFloat = 100
    }
    
    let album: Album
    
    var body: some View {
        HStack(spacing: 16) {
            thumbnailView
            infoView
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity, maxHeight: Constants.rowHeight)
    }
    
    var thumbnailView: some View {
        AsyncImage(url: URL(string: album.thumbnailURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(width: Constants.rowHeight, height: Constants.rowHeight)
    }
    
    var infoView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(album.name)
                .bold()
            Text(album.artistName)
                .italic()
                .foregroundColor(.gray)
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album.mock
        
        List([album, album, album]) { album in
            AlbumRowView(album: album)
        }
    }
}
