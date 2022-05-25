//
//  Endpoints.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation

class Service {
    static let baseUrl = "https://api.mercadolibre.com/"

    enum Endpoints {
        static let products = baseUrl + "sites/%@/search"
        static let productDetail = baseUrl + "items"
    }
}
