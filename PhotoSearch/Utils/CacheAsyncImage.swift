//
//  CacheAsyncImage.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// CacheAsyncImage for caching downloaded images and retriving images from ImageCache

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    
    private let url: URL
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL, @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.content = content
    }
    
    var body: some View {
        if let cached = ImageCache[url] {
//            let _ = print("cached \(url.absoluteString)")
            content(.success(cached))
        } else {
//            let _ = print("request \(url.absoluteString)")
            AsyncImage(url: url) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    
    private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}
