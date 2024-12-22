//
//  PhotosCell.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit
import Kingfisher

class PhotosCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with photo: Photo) {
        
        
        let processor = DownsamplingImageProcessor(size: photoImgView.bounds.size)
        photoImgView.kf.indicatorType = .activity
        
        KF.url(photo.url)
            .placeholder(UIImage(named: "placeholderImage"))
            .setProcessor(processor)
            .cacheOriginalImage()
            .fade(duration: 0.25)
            .set(to: photoImgView)
        
    }
    
}
