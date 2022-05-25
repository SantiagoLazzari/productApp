//
//  SelectCountryViewController.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import UIKit

class SelectCountryViewController: BaseViewController {
    //    MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .blueMELI
            titleLabel.text = "Seleccione su país"
            titleLabel.font = .systemFont(ofSize: 55, weight: .bold)
            titleLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var uyButton: MELIButton! {
        didSet {
            uyButton.setTitle("URUGUAY", for: .normal)
        }
    }

    @IBOutlet weak var arButton: MELIButton! {
        didSet {
            arButton.setTitle("ARGENTINA", for: .normal)
        }
    }
    //    MARK: - properties
    let router: SelectCountryRouter
    let viewModel: SelectCountryViewModel

    //  MARK: - Life Cycle
    init(viewModel: SelectCountryViewModel, router: SelectCountryRouter){
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: SelectCountryViewController.nibName, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellowMELI
    }
    @IBAction func uyButtonAction(_ sender: Any) {
        SessionManager.shared.configure(site: .uy)
        router.route(route: .home, context: self)
    }
    
    @IBAction func arButtonAction(_ sender: Any) {
        SessionManager.shared.configure(site: .ar)
        router.route(route: .home, context: self)
    }
}
