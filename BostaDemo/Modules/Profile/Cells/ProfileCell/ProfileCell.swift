//
//  ProfileCell.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(album: Album){
        titleLbl.text = album.title
    }
    
}
