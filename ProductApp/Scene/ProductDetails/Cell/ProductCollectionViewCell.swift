//
//  ProductCollectionViewCell.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var image: UIImageView! {
        didSet {
            image.contentMode = .scaleAspectFit
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
        }
    }
    
    func set(imageUrl: String) {
        image.sd_setImage(with: URL(string: imageUrl))
    }

}
