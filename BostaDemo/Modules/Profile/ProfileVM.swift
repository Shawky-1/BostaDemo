//
//  ProfileVM.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

class ProfileVM: BaseViewModel {
    //MARK: - Properties
    let repo: Repository
    let usersUseCase: UsersUseCase
    let albumsUseCase: AlbumsUseCase
    
    var albums: [Album] = []
    var user: User?

    
    init(repository: Repository) {
        repo = repository
        user = nil
        usersUseCase = UsersUseCase(repository: repo)
        albumsUseCase = AlbumsUseCase(repository: repo)
    }
    
    func viewDidLoad() {
        fetchUsers()
    }
    
    //MARK: - Private functions
    private func fetchUsers() {
        usersUseCase.execute().sink { completion in
            switch completion {
            case .finished: print("Sucess")
            case .failure(let error): print("error: \(error)")
            }
        } receiveValue: {[weak self] users in
            self?.state = .success
            self?.user = users.randomElement()
            self?.fetchAlbums()
        }.store(in: &cancellables)
    }
    
    private func fetchAlbums() {
        albumsUseCase
            .execute(with: user?.id ?? 0)
            .sink { completion in
                switch completion {
                case .finished: print("Sucess")
                case .failure(let error): print("error: \(error)")
                }
        } receiveValue: {[weak self] albums in
            self?.albums = albums
            self?.state = .success
        }.store(in: &cancellables)
    }
    
}
