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
    
    private var cancellables = Set<AnyCancellable>()
    private static let accessKey = "wG_IpOt9zfdqTl-pM5kMddbDefK5fRE9LiTM_mIaDtc"
    
    func getPhotoData(seacrhWord: String) {
        
        isLoading = true
        errorMessage = nil
        
        let trimmedWord = seacrhWord.filter { !$0.isWhitespace }
        
        if trimmedWord.isEmpty {
            isLoading = false
            errorMessage = "Please enter a valid search word"
        } else {
            NetworkManager.shared.getData(query: trimmedWord, id: PhotoResultsViewModel.accessKey, type: Photo.self)
                .sink { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let err):
                        self?.errorMessage = err.localizedDescription
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
    
    func removeItem(at offsets: IndexSet) {
        photoResult.remove(atOffsets: offsets)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        photoResult.move(fromOffsets: from, toOffset: to)
    }
    
    func filterPhotoResult(byText: String) -> [PhotoResult] {
        return byText.count > 0 ? photoResult.filter { ($0.description?.lowercased() ?? "").contains(byText.lowercased()) } : photoResult
    }
}
