//
//  ProductResponse.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import Foundation

struct ProductResponse: Codable {
    let code: Int
    let body: Product
}
