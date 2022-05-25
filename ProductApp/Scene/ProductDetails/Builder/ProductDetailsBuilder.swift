//
//  ProductDetailsBuilder.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import Foundation

struct ProductDetailsBuilder {
    static func build(id: String) -> ProductDetailsViewController {
        let viewModel = ProductDetailsViewModel(id: id)
        return ProductDetailsViewController(viewModel: viewModel)
    }
}
