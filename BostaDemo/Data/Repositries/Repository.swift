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
        return remoteDataService.request(with: .getUsers)
    }
    
    func fetchAlbums(with query: Int) -> AnyPublisher<[Album], Error> {
        return remoteDataService.request(with: .getAlbums(userId: query))
    }
    
    func fetchPhotos(with query: Int) -> AnyPublisher<[Photo], Error> {
        return remoteDataService.request(with: .getPhotos(albumId: query))
    }

}

//MARK: - Create Remote Repo
extension Repository{
    static func create() -> Repository {
        let remoteDataService = APIService()
        return Repository(remoteDataService: remoteDataService)
    }
}
