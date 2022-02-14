//
//  ContentView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 10/02/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var photoResultsViewModel = PhotoResultsViewModel()
    
    var body: some View {
        if photoResultsViewModel.isLoading {
            LoadingView()
        } else if photoResultsViewModel.errorMessage != nil {
            ErrorView(photoResultsViewModel: photoResultsViewModel)
        } else if photoResultsViewModel.photoResult.count > 0 {
            PhotoListView(photoResultsViewModel: photoResultsViewModel)
        } else {
            PhotoSearchView(photoResultsViewModel: photoResultsViewModel)
        }
        
    }
}
                
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
