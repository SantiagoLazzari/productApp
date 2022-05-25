//
//  SelectCountryRouter.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

class SelectCountryRouter: Router {

    enum Route {
        case home
    }

    func route(route: Route, context: UIViewController) {
        switch route {
        case .home:
            context.navigationController?.pushViewController(HomeBuilder.build(), animated: true)
        }
    }
}
