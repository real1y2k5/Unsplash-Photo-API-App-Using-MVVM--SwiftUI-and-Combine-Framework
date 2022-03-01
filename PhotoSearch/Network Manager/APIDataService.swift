//
//  APIDataService.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 11/02/2022.
//
// API data service to make service call to the API for search word photos

import Foundation

protocol APIDataServiceProtocol {
    func getPhotoData(url: String?, completion: @escaping(Result<Photo, APIError>) -> Void)
}

struct APIDataService: APIDataServiceProtocol {
    
    func getPhotoData(url: String?, completion: @escaping(Result<Photo, APIError>) -> Void) {
        guard let urlString = url, let endpoint = URL(string: urlString) else {
            return completion(Result.failure(APIError.badURL))
        }
        
        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let photo = try decoder.decode(Photo.self, from: data)
                    completion(Result.success(photo))
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }.resume()
    }
}
