//
//  UsersUseCase.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

class UsersUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[User], Error> {
        repository.fetchUsers()
    }
}
