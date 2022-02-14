//
//  PhotoSearchTests.swift
//  PhotoSearchTests
//
//  Created by Ridwan Ayinla  on 14/02/2022.
//

import XCTest
import Combine
@testable import PhotoSearch

class PhotoSearchTests: XCTestCase {
    
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
    
}

//import XCTest
//
//class PhotoSearchTests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

