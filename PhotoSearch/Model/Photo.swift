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
    
    static func dummyResponse() -> Photo {
        return Photo(results: [PhotoResult(id: "eOLpJjhkgbsQ", description: "Yet another photo.", likes: 20, urls: PhotoURL(regular: "https://images.unsplash.com/photo-1416339kjggklhefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=92f3e02f63678acc8416d044e189f515")),
                               PhotoResult(id: "eOLpJytrbsQ", description: "A man drinking a coffee.", likes: 286, urls: PhotoURL(regular: "https://images.unsplash.com/photo-1416339306562-f3d12fefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crkjjhkhkb&w=1080&fit=max&s=92f3e02f63678acc8416d044e189f515"))])
    }
    
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
            
