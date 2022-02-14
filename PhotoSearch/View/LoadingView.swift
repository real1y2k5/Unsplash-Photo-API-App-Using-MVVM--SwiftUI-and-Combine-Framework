//
//  LoadingView.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 13/02/2022.
//
// Loading view displayed when API request is made

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            ProgressView()
            Text("Getting images ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
