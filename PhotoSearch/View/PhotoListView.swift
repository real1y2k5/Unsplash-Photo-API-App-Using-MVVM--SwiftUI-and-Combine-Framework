//
//  PhotoListView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// Photo list view to display the list of all images and there number of likes return from API

import SwiftUI

struct PhotoListView: View {
    @StateObject var photoResultsViewModel: PhotoResultsViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photoResultsViewModel.photoResult, id: \.id) {  result in
                    PhotoCell(photoResult: result)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Photo Search Results")
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                if searchText.count >  0 {
                    photoResultsViewModel.getPhotoData(seacrhWord: searchText)
                }
            }
        }
    }
}
