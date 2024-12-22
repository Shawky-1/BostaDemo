//
//  ProfileDataSrc.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import UIKit

class ProfileDataSrc: NSObject {
    let viewModel: ProfileVM
    
    var navigateToDetail: ((Album) -> Void)?
    
    init(viewModel: ProfileVM) {
        self.viewModel = viewModel
    }
}
//MARK: - DataSource
extension ProfileDataSrc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: ProfileCell.self, with: indexPath)
        let album = viewModel.albums[indexPath.row]
        cell.setupCell(album: album)
        return cell
    }
}
//MARK: - Delegate
extension ProfileDataSrc: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = viewModel.albums[indexPath.row]
        navigateToDetail?(album)
    }
}

//MARK: - UI Setup
extension ProfileDataSrc {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = DefaultHeader(title: "My Albums")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}
