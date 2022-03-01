//
//  PhotoSearchViewModelTests.swift
//  PhotoSearchTests
//
//  Created by Ridwan Ayinla  on 17/02/2022.
//

import XCTest
import Combine
@testable import PhotoSearch

class PhotoSearchViewModelTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    func testGetPhotoSuccess() {
        let result = Result<Photo, APIError>.success(Photo.dummyResponse())
        let viewModel = PhotoResultsViewModel(service: APIDataServiceMock(result: result))
        viewModel.getPhotoData(seacrhWord: "Test")
        let promise = expectation(description: "Getting Photos")
        
        viewModel.$photo.sink { photo in
            if photo.results?.count == 2 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
    
    func testGetPhotoSuccessEmptyResponse() {
        let result = Result<Photo, APIError>.success(Photo(results: []))
        let viewModel = PhotoResultsViewModel(service: APIDataServiceMock(result: result))
        viewModel.getPhotoData(seacrhWord: "Test")
        let promise = expectation(description: "Getting Photos")
        
        viewModel.$photo.sink { photo in
            if ((photo.results?.isEmpty) != nil) {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    func testGetPhotoFailure() {
        let result = Result<Photo, APIError>.failure(APIError.badURL)
        let viewModel = PhotoResultsViewModel(service: APIDataServiceMock(result: result))
        viewModel.getPhotoData(seacrhWord: "Test")
        let promise = expectation(description: "Getting Photos")
        
        viewModel.$photo.sink { photo in
            if let results = photo.results, !results.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        viewModel.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
}

