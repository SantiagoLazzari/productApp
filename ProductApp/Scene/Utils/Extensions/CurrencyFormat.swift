//
//  FloatExtension.swift
//  ProductApp
//
//  Created by Bruno Fontes on 25/5/22.
//

import Foundation

struct CurrencyFormat {
    static func currency(value: Float, symbol: Currency) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.currencySymbol = symbol == .USD ? "U$S" : "$"
        numberFormatter.locale = Locale(identifier: "es_UY")
        return numberFormatter.string(from: value as NSNumber)!
    }
}
