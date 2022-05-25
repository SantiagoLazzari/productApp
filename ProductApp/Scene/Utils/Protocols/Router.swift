//
//  Router.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

protocol Router {

    associatedtype Route

    func route(route: Route, context: UIViewController)
}
