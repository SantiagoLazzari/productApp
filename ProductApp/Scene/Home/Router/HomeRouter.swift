//
//  HomeRouter.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import UIKit

class HomeRouter: Router {

    enum Route {
        case productDetails(id: String)
    }

    func route(route: Route, context: UIViewController) {
        switch route {
        case .productDetails(let id):
            context.navigationController?.pushViewController(ProductDetailsBuilder.build(id: id), animated: true)
        }
    }
}
