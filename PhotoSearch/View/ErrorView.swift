//
//  ErrorView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// An Error view to display API error message
import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var photoResultsViewModel: PhotoResultsViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            if let errorMessage = photoResultsViewModel.errorMessage {
                Text("❌").font(.system(size: 50))
                Text(errorMessage).font(.system(size: 50))
            }
            Button {
                photoResultsViewModel.errorMessage = nil
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Back")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(photoResultsViewModel: PhotoResultsViewModel())
    }
}
