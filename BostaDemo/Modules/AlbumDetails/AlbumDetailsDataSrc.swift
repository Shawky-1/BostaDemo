//
//  AlbumDetailsDataSrc.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import UIKit

class AlbumDetailsDataSrc: NSObject {
    let viewModel: AlbumDetailsVM
    
    init(viewModel: AlbumDetailsVM) {
        self.viewModel = viewModel
    }
}

//MARK: - DataSource
extension AlbumDetailsDataSrc: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredPhotos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PhotosCell.self, for: indexPath)
        let photo = viewModel.filteredPhotos[indexPath.item]
        cell.setupCell(with: photo)
        
        return cell
    }
}

//MARK: - Delegate
extension AlbumDetailsDataSrc: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
