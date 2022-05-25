//
//  Product.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import Foundation

struct Product: Codable {

    let id: String
    let title: String
    let thumbnail: String
    let currency: Currency
    let availableQuantity: Int
    let price: Float
    let acceptMerCadoPago: Bool
    let address: Address
    let pictures: [Picture]

    var fullAddress: String {
        return address.city.name + ", " + address.state.name
    }

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
        case acceptMerCadoPago = "accepts_mercadopago"
        case address =  "seller_address"
        case pictures
    }
}

struct Picture: Codable {
    let url: String

    enum CodingKeys: String, CodingKey {
        case url = "secure_url"
    }
}

struct Address: Codable {
    let city: AddressData
    let state: AddressData
}

struct AddressData: Codable {
    let id: String
    let name: String
}
