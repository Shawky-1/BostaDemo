//
//  Repository.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

class Repository {
    private let remoteDataService: APIServiceProtocol
    init(remoteDataService: APIServiceProtocol) {
        self.remoteDataService = remoteDataService
    }
}

extension Repository {
    //MARK: - Remote functions
    func fetchUsers() -> AnyPublisher<[User], Error> {
        guard let request = RequestBuilder.buildRequest(baseURL: EndPoint.baseURL, path: "/users") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return remoteDataService.request(with: request)
    }
    
    func fetchAlbums(with query: Int) -> AnyPublisher<[Album], Error> {
        guard let request = RequestBuilder.buildRequest(baseURL: EndPoint.baseURL,
                                                        path: "/albums",
                                                        parameters: ["userId" : "\(query)"]) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return remoteDataService.request(with: request)
    }
    
    func fetchPhotos(with query: Int) -> AnyPublisher<[Photo], Error> {
        guard let request = RequestBuilder.buildRequest(baseURL: EndPoint.baseURL,
                                                        path: "/photos",
                                                        parameters: ["albumId" : "\(query)"]) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return remoteDataService.request(with: request)
    }

}

extension Repository{
    static func create() -> Repository {
        let remoteDataService = APIService()
        return Repository(remoteDataService: remoteDataService)
    }
}
