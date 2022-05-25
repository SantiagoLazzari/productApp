//
//  BaseViewController.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

class BaseViewController: UIViewController, NibLoadable {

    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(actionButton)
        self.present(alert, animated: true, completion: nil)
    }
}
