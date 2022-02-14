//
//  PhotoResultsViewModel.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 11/02/2022.
//

import Foundation
import Combine
import UIKit

class PhotoResultsViewModel: ObservableObject {
    
    @Published var photoResult = [PhotoResult]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var searchWord: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private static let accessKey = "wG_IpOt9zfdqTl-pM5kMddbDefK5fRE9LiTM_mIaDtc"
    
    func getPhotoData(seacrhWord: String) {
        
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.getData(query: seacrhWord, id: PhotoResultsViewModel.accessKey, type: Photo.self)
            .sink { [self] completion in
                isLoading = false
                searchWord = seacrhWord
                switch completion {
                case .failure(let err):
                    errorMessage = err.localizedDescription
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
    receiveValue: { [weak self] photoData in
        guard let results = photoData.results else { return }
        
        if results.count > 0 {
            self?.photoResult = results
        } else {
            self?.errorMessage = "Sorry, No images found"
        }
    }
    .store(in: &cancellables)
    }
}
