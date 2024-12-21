//
//  AlbumsUseCase.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

class AlbumsUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func execute(with query: Int) -> AnyPublisher<[Album], Error> {
        repository.fetchAlbums(with: query)
    }
}
