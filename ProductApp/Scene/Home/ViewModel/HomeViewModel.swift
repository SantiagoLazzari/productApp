//
//  HomeViewModel.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation

class HomeViewModel {

    var tableViewData: [HomeCell] = []
    var page: Int = 1
    var productTitle: String?

    func getProducts(success: @escaping (_ products: [HomeCell]) -> (), failure: @escaping (_ errorMessage: String) -> ()) {
        guard let productTitle = productTitle else { return }
        NetworkingProvider.shared.getProducts(page: page, productTitle: productTitle) { products in
            self.page += 1
            for product in products {
                self.tableViewData.append(.product(product: product))
            }
            success(self.tableViewData)
        } failure: { error in
            failure(error)
        }
    }
}
