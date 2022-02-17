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
    
    let dummyResponse =  Photo(results: [PhotoResult(id: "eOLpJjhkgbsQ", description: "Yet another photo.", likes: 20, urls: PhotoURL(regular: "https://images.unsplash.com/photo-1416339kjggklhefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=92f3e02f63678acc8416d044e189f515")),
                                         PhotoResult(id: "eOLpJytrbsQ", description: "A man drinking a coffee.", likes: 286, urls: PhotoURL(regular: "https://images.unsplash.com/photo-1416339306562-f3d12fefd36f?ixlib=rb-0.3.5&q=80&fm=jpg&crkjjhkhkb&w=1080&fit=max&s=92f3e02f63678acc8416d044e189f515"))])
    
    var subscriptions = Set<AnyCancellable>()
    
    override func setUp() {
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    func testGetPhotoSuccess() {
        
    }
    
    func testGetPhotoFailure() {
        
    }
    
    func test_searchWord_isNil() {
        let vm = PhotoResultsViewModel()
        vm.searchWord = nil
        XCTAssertNil(vm.searchWord)
    }
    
    func test_searchWord_isNotNil() {
        let vm = PhotoResultsViewModel()
        vm.searchWord = "Toys"
        XCTAssertEqual(vm.searchWord, "Toys")
    }
    
    func test_errorMessage_isNil() {
        let vm = PhotoResultsViewModel()
        vm.errorMessage = nil
        XCTAssertNil(vm.errorMessage)
    }
    
    func test_errorMessage_isNotNil() {
        let vm = PhotoResultsViewModel()
        vm.errorMessage = "some error message"
        XCTAssertEqual(vm.errorMessage, "some error message")
    }
    
    func test_isLoading_equalsInjectedValue() {
        let value: Bool = Bool.random()
        let vm = PhotoResultsViewModel()
        vm.isLoading = value
        XCTAssertEqual(vm.isLoading, value)
    }
    
    func test_isLoading_equalsInjectedValue_StressTest() {
        
        for _ in 0..<10 {
            let value: Bool = Bool.random()
            let vm = PhotoResultsViewModel()
            vm.isLoading = value
            XCTAssertEqual(vm.isLoading, value)
        }
    }
}

