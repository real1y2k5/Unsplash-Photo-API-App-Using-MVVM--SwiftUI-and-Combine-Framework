//
//  PhotoCell.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// Photo cell to display each image and the number of likes returned from the API

import SwiftUI

struct PhotoCell: View {
    let photoResult: PhotoResult
    let imageSize: CGFloat = 150
    
    var body: some View {
        HStack {
            if let urlString = photoResult.urls?.regular, let url = URL(string: urlString) {
                CacheAsyncImage(url: url ) { phase in
                    switch phase {
                    case .empty:
                        Color.white.frame(width: imageSize, height: imageSize)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(maxWidth: imageSize, maxHeight: imageSize)
                            .clipped()
                    case .failure:
                        Color.black.frame(width: imageSize, height: imageSize)
                    @unknown default:
                        EmptyView()
                    }
                }
                
            }
            VStack(alignment: .leading, spacing: 5) {
                if let descprition = photoResult.description {
                    Text(descprition)
                        .lineLimit(5)
                }
                if let likes = photoResult.likes {
                    Text("Liked by \(likes) others")
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }
            }
        }
    }
}
