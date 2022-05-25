//
//  Product.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation

enum Currency: String, Codable {
    case ARS
    case UYU
    case USD
}

struct Item: Codable {
    let id: String
    let title: String
    let thumbnail: String
    let currency: Currency
    let availableQuantity: Int
    let price: Float

    var fullPrice: String {
        return CurrencyFormat.currency(value: price, symbol: currency)
    }
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case currency = "currency_id"
        case price
        case availableQuantity = "available_quantity"
    }


}
