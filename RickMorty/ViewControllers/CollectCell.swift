//
//  CollectCell.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit
import SDWebImage


class CollectCell: UICollectionViewCell {

    
    @IBOutlet var labelView: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    
    func configure(with imageURL: URL) {
        imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(systemName: "heart"))
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 13
    }

}
