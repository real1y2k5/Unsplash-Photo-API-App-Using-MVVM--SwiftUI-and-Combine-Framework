//
//  Photo.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 11/02/2022.
//
// A model for photo objects returned from the API to get the random photos urls

import Foundation

struct Photo: Codable {
    let results: [PhotoResult]?
    
}

struct PhotoResult: Codable, Identifiable {
    let id: String?
    let description: String?
    let likes: Int?
    let urls: PhotoURL?
}

struct PhotoURL: Codable {
    let regular: String?
}
