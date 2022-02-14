//
//  ImageCache.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 12/02/2022.
//
// ImageCache object for caching downloaded images

import SwiftUI

class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
