//
//  ProductDetailsViewController.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//

import UIKit

class ProductDetailsViewController: BaseViewController {
    //  MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.isHidden = true
            titleLabel.textColor = .blueMELI
            titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
            titleLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = collectionViewDataSource
            collectionView.register(UINib(nibName: ProductCollectionViewCell.nibName, bundle: nil),
                                    forCellWithReuseIdentifier: ProductCollectionViewCell.nibName)
        }
    }
    @IBOutlet weak var detailsStackView: UIStackView!


    //  MARK: - properties
    let viewModel: ProductDetailsViewModel
    let collectionViewDataSource = ProductCollectionDataSource()

    //  MARK: - Life Cycle
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ProductDetailsViewController.nibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        getProduct()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setupView(product: Product) {
        titleLabel.isHidden = false
        titleLabel.text = product.title
        collectionViewDataSource.pictures = product.pictures
        collectionView.reloadData()

        if product.acceptMerCadoPago {
            let acceptMerCadoPagoLabel = UILabel()
            acceptMerCadoPagoLabel.text = "Acepta MercadoPago"
            acceptMerCadoPagoLabel.font = .systemFont(ofSize: 14, weight: .bold)
            acceptMerCadoPagoLabel.textAlignment = .center
            acceptMerCadoPagoLabel.textColor = .white
            acceptMerCadoPagoLabel.backgroundColor = .skyBlueMELI
            acceptMerCadoPagoLabel.layer.cornerRadius = 5
            acceptMerCadoPagoLabel.layer.masksToBounds = true
            detailsStackView.addArrangedSubview(acceptMerCadoPagoLabel)
        }
        let priceLabel = UILabel()
        priceLabel.text = product.fullPrice
        priceLabel.font = .systemFont(ofSize: 32, weight: .bold)

        detailsStackView.addArrangedSubview(priceLabel)

        let quantityLabel = UILabel()
        quantityLabel.text = "Disponibles: \(product.availableQuantity)"
        quantityLabel.textColor = .gray
        quantityLabel.font = .systemFont(ofSize: 14, weight: .regular)

        let addressLabel = UILabel()
        addressLabel.text = product.fullAddress
        addressLabel.textColor = .blueMELI
        addressLabel.font = .systemFont(ofSize: 14, weight: .bold)

        let fillView = UIView()
        fillView.backgroundColor = .clear
        detailsStackView.addArrangedSubview(quantityLabel)
        detailsStackView.addArrangedSubview(addressLabel)
        detailsStackView.addArrangedSubview(fillView)
    }

    func getProduct(){
        view.showBlurLoader()

        viewModel.getProductDetail { product in
            self.view.removeBluerLoader()
            self.setupView(product: product)
        } failure: { errorMessage in
            DispatchQueue.main.async {
                self.view.removeBluerLoader()
                self.showErrorAlert(message: errorMessage)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}
