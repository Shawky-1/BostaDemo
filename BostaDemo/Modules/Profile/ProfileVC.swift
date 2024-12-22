//
//  ProfileVC.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit

class ProfileVC: BaseViewController<ProfileVM> {

    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    private lazy var profileDataSrc: ProfileDataSrc = ProfileDataSrc(viewModel: viewModel)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
        bindDataSrc()
    }
    
    override func reloadUI() {
        tableView.reloadData()
        nameLbl.text = viewModel.user?.name
        addressLbl.text = viewModel.user?.address
    }
    
    private func bindDataSrc() {
        profileDataSrc.navigateToDetail = { [weak self] album in
            self?.navigateToAlbumDetails(with: album)
        }
    }
}

//MARK: - Setup Functions
extension ProfileVC {
    private func setupUI() {
        setupTableView()
        title = "Profile"
    }
    
    private func setupTableView() {
        tableView.dataSource = profileDataSrc
        tableView.delegate = profileDataSrc
        tableView.register(cell: ProfileCell.self)
    }
}

extension ProfileVC {
    
    private func navigateToAlbumDetails(with album: Album) {
        let repo = Repository.create()
        let vm = AlbumDetailsVM(repository: repo, album: album)
        let vc = AlbumDetailsVC(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
}
