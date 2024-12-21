//
//  PhotosUseCase.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

class PhotosUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func execute(with query: Int) -> AnyPublisher<[Photo], Error> {
        repository.fetchPhotos(with: query)
    }
}
