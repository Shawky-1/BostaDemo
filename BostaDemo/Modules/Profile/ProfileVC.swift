//
//  ProfileVC.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit

class ProfileVC: BaseViewController<ProfileVM> {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    private lazy var profileDataSrc: ProfileDataSrc = ProfileDataSrc(viewModel: viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
        title = "Profile"
    }
    
    override func reloadUI() {
        tableView.reloadData()
        nameLbl.text = viewModel.user?.name
        addressLbl.text = viewModel.user?.address
    }

    
    func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = profileDataSrc
        tableView.delegate = profileDataSrc
        tableView.register(cell: ProfileCell.self)
    }
    


}
