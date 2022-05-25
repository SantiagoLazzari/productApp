//
//  NibLoadable.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

protocol NibLoadable: AnyObject {}

extension NibLoadable where Self: UIViewController {
    static var nibName: String {
        return String(describing: self)
    }
}
