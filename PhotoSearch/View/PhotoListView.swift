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
                .onDelete(perform: removeRow)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Photo Search Results")
            .toolbar {
                EditButton()
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                photoResultsViewModel.getPhotoData(seacrhWord: searchText)
            }
        }
    }
    
    private func removeRow(at offsets: IndexSet) {
        photoResultsViewModel.photoResult.remove(atOffsets: offsets)
    }
}
