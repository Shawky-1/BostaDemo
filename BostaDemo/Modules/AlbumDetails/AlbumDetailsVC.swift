//
//  AlbumDetailsVC.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit

class AlbumDetailsVC: BaseViewController<AlbumDetailsVM> {
    
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var albumDetailsDataSrc: AlbumDetailsDataSrc = AlbumDetailsDataSrc(viewModel: viewModel)
    private var searchController: UISearchController!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindDataSrc()
        setupUI()
    }
    
    override func reloadUI() {
        collectionView.reloadData()
    }
    
    private func bindDataSrc() {
        albumDetailsDataSrc.navigateImageDetails = { [weak self] photo in
            self?.navigateToImageDetails(with: photo)
        }
    }
    
}

//MARK: - Setup Functions
extension AlbumDetailsVC {
    
    private func setupUI() {
        self.title = viewModel.album.title
        setupCollectionView()
        setupSearchBar()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = albumDetailsDataSrc
        collectionView.delegate = albumDetailsDataSrc
        collectionView.register(cell: PhotosCell.self)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let totalWidth = view.bounds.width + 10
        let itemWidth = floor(totalWidth / 3)
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout
        
        
    }
    
}

//MARK: - Search controller
extension AlbumDetailsVC: UISearchResultsUpdating {
    
    private func setupSearchBar() {
        searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.filterPhotos(with: text)
    }
    
}

//MARK: - Navigation
extension AlbumDetailsVC {
    private func navigateToImageDetails(with photo: Photo) {
        let imageViewer = ImageViewerVC(photo: photo)
        present(imageViewer, animated: true)
    }
}
