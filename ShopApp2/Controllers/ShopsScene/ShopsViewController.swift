//
//  ShopsViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 21.1.22.
//

import UIKit

class ShopsViewController: UIViewController {

    var filteredShops: [Shop] = DataHolder.shops
    var navBar: NavigationView!
    var searchBar: UISearchBar!
    var shopTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.navBar = NavigationView()
        self.navBar.delegate = self
        self.view.addSubview(self.navBar)
        
        self.searchBar = UISearchBar()
        self.searchBar.barTintColor = .clear
        self.searchBar.backgroundColor = .clear
        self.searchBar.isTranslucent = true
        self.searchBar.searchTextField.backgroundColor = .white
        self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        self.searchBar.delegate = self
        self.searchBar.placeholder = "Search Clients"
        self.view.addSubview(self.searchBar)
        
        shopTableView = UITableView()
        shopTableView.backgroundColor = .clear
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.separatorStyle = .none
        shopTableView.showsVerticalScrollIndicator = false
        shopTableView.register(ShopTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(shopTableView)
    }
    
    func setupConstraints() {
        self.navBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.navBar.snp.bottom).offset(15)
            make.right.equalTo(self.view).offset(-15)
            make.left.equalTo(self.view).offset(15)
        }
        
        shopTableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    
}

extension ShopsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredShops = []
        
        if searchText == "" {
            filteredShops = DataHolder.shops
        }
        
        for shop in DataHolder.shops {
            if shop.name.contains(searchText) {
                filteredShops.append(shop)
            }
        }
        
        self.shopTableView.reloadData()
    }
}

extension ShopsViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.shopTableView.dequeueReusableCell(withIdentifier: "cell") as! ShopTableViewCell
        
        cell.configureCell(shop: self.filteredShops[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedShop = self.filteredShops[indexPath.row]
        let shopDetailsVC = ShopDetailsViewController()
        shopDetailsVC.shop = selectedShop
        
        self.navigationController?.pushViewController(shopDetailsVC, animated: true)
    }
}

extension ShopsViewController: NavigationViewDelegate {
    func notificationsButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
    
    }
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        let cartVC = CartViewController()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
}
