//
//  NetworkManager.swift
//  PhotoSearch
//
//  Created by Ridwan Ayinla  on 11/02/2022.
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.unsplash.com/search/photos?page=1&per_page=50&query="
    
    func getData<T: Decodable>(query: String?, id: String, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            guard let self = self, let searchWord = query, let endpoint = URL(string: self.baseURL + "\(searchWord)&client_id=\(id)") else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            print("URL is \(endpoint.absoluteString)")
            URLSession.shared.dataTaskPublisher(for: endpoint)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}


enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
