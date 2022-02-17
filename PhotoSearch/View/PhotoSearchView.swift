//
//  PhotoSearchView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// Photo search view presented to users to search immages

import SwiftUI

struct PhotoSearchView: View {
    
    @StateObject var photoResultsViewModel: PhotoResultsViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            Text("Unsplash Photo App")
                .multilineTextAlignment(.center)
                .padding()
                .navigationTitle("Photo Search")
                .searchable(text: $searchText)
                .onSubmit(of: .search) {
                    photoResultsViewModel.getPhotoData(seacrhWord: searchText)
                }
        }
        
    }
}

struct PhotoSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSearchView(photoResultsViewModel: PhotoResultsViewModel())
    }
}
