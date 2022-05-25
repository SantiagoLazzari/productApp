//
//  SelectCountryBuilder.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation

struct SelectoCountryBuilder {
    static func build() -> SelectCountryViewController {
        let viewModel: SelectCountryViewModel = SelectCountryViewModel()
        let router: SelectCountryRouter = SelectCountryRouter()
        return SelectCountryViewController(viewModel: viewModel, router: router)
    }
}
