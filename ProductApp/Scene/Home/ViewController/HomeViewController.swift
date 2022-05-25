//
//  HomeViewController.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

class HomeViewController: BaseViewController {
    //    MARK: - Outlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.dataSource = tableViewDataSource
            tableView.delegate = tableViewDelegate
            tableView.register(UINib(nibName: ProductTableViewCell.nibName, bundle: nil),
                               forCellReuseIdentifier: ProductTableViewCell.nibName)
            tableView.isHidden = true
        }
    }
    @IBOutlet weak var messageLabel: UILabel! {
        didSet {
            messageLabel.text = "Comience a buscar en Mercado Libre"
            messageLabel.font = .systemFont(ofSize: 24, weight: .bold)
            messageLabel.numberOfLines = 0
            messageLabel.textColor = .blueMELI
        }
    }
    @IBOutlet weak var messageImage: UIImageView! {
        didSet {
            messageImage.image = UIImage(systemName: "magnifyingglass.circle.fill")
            messageImage.tintColor = .blueMELI
        }
    }
    //    MARK: - properties
    let viewModel: HomeViewModel
    let router: HomeRouter
    var tableViewDataSource: HomeTableViewDataSource?
    var tableViewDelegate: HomeTableViewDelegate?
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

    //  MARK: - Life Cycle
    init(viewModel: HomeViewModel, router: HomeRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: HomeViewController.nibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.cornerRadius = 20
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
    }

    func searchAction(titleProduct: String) {
        viewModel.tableViewData = []
        viewModel.productTitle = titleProduct
        viewModel.getProducts() { products in
            if products.isEmpty {
                self.errorResult(message: "No se encontro resultados", image: "eyeglasses")
            } else {
                self.messageLabel.isHidden = true
                self.messageImage.isHidden = true
                self.tableView.isHidden = false
                self.searchBar.text = ""
            }
            self.tableViewDataSource?.dataSource = products
            self.tableView.reloadData()
            self.view.removeBluerLoader()
        } failure: { errorMessage in
            DispatchQueue.main.async {
                self.view.removeBluerLoader()
                self.errorResult(message: errorMessage, image: "wifi.exclamationmark")
            }
        }
    }

    func loadMoreProducts() {
        viewModel.getProducts() { products in
            self.tableViewDataSource?.dataSource = products
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
        } failure: {errorMessage in
            DispatchQueue.main.async {
                self.errorResult(message: errorMessage, image: "wifi.exclamationmark")
                self.tableView.tableFooterView = nil
            }
        }
    }

    func errorResult(message: String, image: String) {
        DispatchQueue.main.async {
            self.tableView.isHidden = true
            self.messageLabel.isHidden = false
            self.messageImage.isHidden = false
            self.messageLabel.text = message
            self.messageImage.image = UIImage(systemName: image)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let titleProduct = searchBar.text else { return }
        view.showBlurLoader()
        searchAction(titleProduct: titleProduct)
    }
}
