//
//  NetworkingProvider.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation
import Alamofire

class NetworkingProvider {
    static let shared = NetworkingProvider()

    func getProducts(page: Int, productTitle: String, success: @escaping (_ products: [Item]) -> (), failure: @escaping (_ error: String) -> ()) {

        let parameters: Parameters = [
            "q": productTitle,
            "limit": 15,
            "offset": page
        ]
        guard let url = URL(string: String(format: Service.Endpoints.products, SessionManager.shared.siteCode)) else { return }
        AF.request(url, method: .get, parameters: parameters).responseDecodable (of: ItemsResponse.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let products = response.value?.results else { return }
                success(products)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }

    func getProductDetails(id: String, success: @escaping (_ product: Product) -> (), failure: @escaping (_ error: String) -> ()) {

        let parameters: Parameters = ["ids": id]

        guard let url = URL(string: Service.Endpoints.productDetail) else { return }
        AF.request(url, method: .get, parameters: parameters).responseDecodable (of: [ProductResponse].self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let product = response.value?.first else { return }
                success(product.body)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
