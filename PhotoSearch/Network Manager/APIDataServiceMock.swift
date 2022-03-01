//
//  APIDataServiceMock.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 28/02/2022.
//
// APIDataServiceMock for API testing
import Foundation

struct APIDataServiceMock: APIDataServiceProtocol {
    
    var result: Result<Photo, APIError>
    
    func getPhotoData(url: String?, completion: @escaping (Result<Photo, APIError>) -> Void) {
        completion(result)
    }
    
}
