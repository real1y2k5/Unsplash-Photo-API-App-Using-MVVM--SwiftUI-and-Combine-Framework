//
//  PhotoSearchView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// Photo search view presented to users to search immages

import SwiftUI

struct PhotoSearchView: View {
    
    @ObservedObject var photoResultsViewModel: PhotoResultsViewModel
    @State private var searchText = ""
    @State private var appMessage = "Unsplash Photo App"
    
    var body: some View {
        NavigationView {
            Text(appMessage)
                .multilineTextAlignment(.center)
                .padding()
                .navigationTitle("Photo Search")
                .searchable(text: $searchText)
                .onSubmit(of: .search) {
                    if searchText.count >  0 {
                        let trimmed = searchText.filter { !$0.isWhitespace }
                        photoResultsViewModel.getPhotoData(seacrhWord: trimmed)
                    }
                }
        }
        
    }
}

struct PhotoSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSearchView(photoResultsViewModel: PhotoResultsViewModel())
    }
}
