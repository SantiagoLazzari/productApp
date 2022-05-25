//
//  ProductDetailsViewModel.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import Foundation

class ProductDetailsViewModel {

    let id: String

    init(id: String) {
        self.id = id
    }

    func getProductDetail(success: @escaping (_ product: Product) -> (), failure: @escaping (_ errorMessage: String) -> ()) {
        NetworkingProvider.shared.getProductDetails(id: id) { product in
            success(product)
        } failure: { error in
            failure(error)
        }
    }
}
