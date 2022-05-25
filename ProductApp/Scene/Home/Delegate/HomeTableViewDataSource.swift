//
//  HomeTableViewDataSource.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

enum HomeCell {
    case product(product: Item)
}

class HomeTableViewDataSource: NSObject, UITableViewDataSource {

    var dataSource: [HomeCell]

    init(dataSource: [HomeCell]) {
        self.dataSource = dataSource
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = dataSource[indexPath.row]
        switch cellType {
        case .product(let product):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.nibName,
                                                           for: indexPath)
                    as? ProductTableViewCell else { return ProductTableViewCell() }
            cell.set(product: product)
            return cell
        }
    }


}
