//
//  HomeBuilder.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

struct HomeBuilder {
    static func build() -> HomeViewController {
        let viewModel: HomeViewModel = HomeViewModel()
        let router: HomeRouter = HomeRouter()
        let controller: HomeViewController = HomeViewController(viewModel: viewModel, router: router)
        controller.tableViewDataSource = HomeTableViewDataSource(dataSource: viewModel.tableViewData)
        controller.tableViewDelegate = HomeTableViewDelegate(controller: controller)
        return controller
    }
}
