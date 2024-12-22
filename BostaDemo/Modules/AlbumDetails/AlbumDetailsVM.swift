//
//  AlbumDetailsVM.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

class AlbumDetailsVM: BaseViewModel {
    //MARK: - Properties
    let repo: Repository
    let photosUseCase: PhotosUseCase
    
    let album: Album
    var photos: [Photo] = []
    var filteredPhotos: [Photo] = []
    
    init(repository: Repository, album: Album) {
        self.repo = repository
        self.photosUseCase = PhotosUseCase(repository: repository)
        self.album = album
    }
    
    func viewDidLoad() {
        fetchPhotos()
    }
    
    //MARK: - Private Functions
    private func fetchPhotos() {
        photosUseCase
            .execute(with: album.id)
            .sink { completion in
                switch completion {
                case .finished: print("Sucess")
                case .failure(let error): print("error: \(error)")
                }
        } receiveValue: {[weak self] photos in
            self?.photos = photos
            self?.filteredPhotos = photos
            self?.state = .success
        }.store(in: &cancellables)
    }
    
    //MARK: - Public Functions
    func filterPhotos(with text: String) {
        let query = text.lowercased()
        if query == "" {
            filteredPhotos = photos
        } else {
            filteredPhotos = photos.filter({$0.title.lowercased().contains(query)})
        }
        state = .success
    }
}
