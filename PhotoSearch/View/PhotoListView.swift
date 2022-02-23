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
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            List {
                ForEach(photoResultsViewModel.filterPhotoResult(byText: searchText)) { result in
                    PhotoCell(photoResult: result)
                }
                .onDelete(perform: photoResultsViewModel.removeItem)
                .onMove(perform: photoResultsViewModel.moveItem)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Photo Search Results")
            .navigationBarItems(leading: Button {
                photoResultsViewModel.errorMessage = nil
                photoResultsViewModel.photoResult = []
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Photo Search")
            }, trailing: EditButton())
            .searchable(text: $searchText)
        }
    }
}
