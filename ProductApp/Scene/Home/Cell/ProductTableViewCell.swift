//
//  ProductTableViewCell.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit
import SDWebImage

class ProductTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = .systemFont(ofSize: 17, weight: .bold)
        }
    }
    @IBOutlet weak var quantityLabel: UILabel! {
        didSet {
            quantityLabel.textColor = .lightGray
            quantityLabel.font = .systemFont(ofSize: 13, weight: .regular)
        }
    }
    @IBOutlet weak var productImage: UIImageView!

    func set(product: Item) {
        titleLabel.text = product.title
        priceLabel.text = product.fullPrice
        quantityLabel.text = "Disponibles: \(product.availableQuantity)"
        productImage.sd_setImage(with: URL(string: product.thumbnail))
    }
    
}
