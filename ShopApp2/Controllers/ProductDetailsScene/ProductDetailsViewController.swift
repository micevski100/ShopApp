//
//  ProductDetailViewController.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 20.1.22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var shop: Shop!
    var product: Product!
    var navigationView: NavigationView!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        
        navigationView = NavigationView()
        navigationView.delegate = self
        navigationView.configure(title: "Product name", backButton: true)
        self.view.addSubview(navigationView)
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ImagesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.register(RelatedProductsTableViewCell.self, forCellReuseIdentifier: "cell3")
        
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.height / 3
        } else if indexPath.row == 1 {
            return UITableView.automaticDimension
        } else {
            return self.view.frame.size.height / 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImagesTableViewCell
        
            
            cell.setupCell(images: product.imageURLs)
            
            return cell
        } else if indexPath.row == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! DescriptionTableViewCell
            
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! RelatedProductsTableViewCell

            cell.setupCell(products: self.shop.products)

            return cell
        }
        
    }
}

//MARK: - BACK BUTTON DELEGATE
extension ProductDetailViewController: NavigationViewDelegate {
    func notificationsButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func cartButtonTapped() {
        let cartVC = CartViewController()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
