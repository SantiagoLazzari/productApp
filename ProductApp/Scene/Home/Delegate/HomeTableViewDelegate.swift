//
//  HomeTableViewDelegate.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

class HomeTableViewDelegate: NSObject, UITableViewDelegate {

    weak var controller: HomeViewController?

    init(controller: HomeViewController) {
        self.controller = controller
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellType = controller?.tableViewDataSource?.dataSource[indexPath.row] else { return }

        switch cellType {
        case .product(product: let product):
            guard let controller = controller else { return }
            controller.router.route(route: .productDetails(id: product.id), context: controller)
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < 10 {
            controller?.tableView.tableFooterView = addFooterView()
            controller?.loadMoreProducts()
        }
    }
}
extension HomeTableViewDelegate {
    private func addFooterView() -> UIView {
        let footerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: controller?.view.frame.size.width ?? 0, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}
