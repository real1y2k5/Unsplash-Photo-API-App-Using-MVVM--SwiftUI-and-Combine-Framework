//
//  PhotoResultsViewModel.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 11/02/2022.
//
// PhotoResultsViewModel handling the logic for photo seeacrh and photo result view

import Foundation

class PhotoResultsViewModel: ObservableObject {
    
    private static let baseURL = "https://api.unsplash.com/search/photos?page=1&per_page=50&query="
    private static let accessKey = "wG_IpOt9zfdqTl-pM5kMddbDefK5fRE9LiTM_mIaDtc"
    private static let seacrhWordError = "Please enter a search word"
    private static let noImageError = "Sorry, No images found"
    
    @Published var photo: Photo = Photo(results: [])
    @Published var photoResult: [PhotoResult] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let dataService: APIDataServiceProtocol
    
    init(service: APIDataServiceProtocol) {
        self.dataService = service
    }
    
    func getPhotoData(seacrhWord: String) {
        
        isLoading = true
        errorMessage = nil
        
        let trimmedWord = seacrhWord.filter { !$0.isWhitespace }
        if trimmedWord.isEmpty {
            isLoading = false
            errorMessage = PhotoResultsViewModel.seacrhWordError
        } else {
            let urlString = PhotoResultsViewModel.baseURL + "\(trimmedWord)&client_id=\(PhotoResultsViewModel.accessKey)"
            self.dataService.getPhotoData(url: urlString) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    case .success(let photo):
                        guard let results = photo.results else { return }
                        if results.isEmpty {
                            self?.errorMessage = PhotoResultsViewModel.noImageError
                        } else {
                            self?.photo = photo
                            self?.photoResult = results
                            
                        }
                    }
                }
            }
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
