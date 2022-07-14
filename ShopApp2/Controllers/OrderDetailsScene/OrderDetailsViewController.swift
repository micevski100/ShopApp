//
//  OrderDetailsViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 16.2.22.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    var orderName: String!
    var navbar: NavigationView!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = .systemGray6
        navbar = NavigationView()
        navbar.configure(title: orderName, backButton: true)
        navbar.cartButton.removeFromSuperview()
        navbar.delegate = self
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.register(OrderDetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(self.view).inset(10)
        }
    }
}

extension OrderDetailsViewController: NavigationViewDelegate {
    
    func backButtonTapped() {
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func notificationsButtonTapped() {
        
    }
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrderDetailsTableViewCell
        
        if indexPath.row == 0 {
            cell.products = ["Product 1"]
            cell.shopNameLabel.text = "Jusepe Shop"
            cell.setupProducts()
            return cell
        } else if indexPath.row == 1 {
            cell.products = ["Product 1", "Product 2"]
            cell.shopNameLabel.text = "Ristopher Shop"
            cell.setupProducts()
            return cell
        } else if indexPath.row == 2 {
            cell.products = ["Product 1", "Product 2", "Product 3"]
            cell.shopNameLabel.text = "Baby TEO rem"
            cell.statusButton.setTitle("Mark as Received", for: .normal)
            cell.statusButton.layer.backgroundColor = UIColor.systemGreen.cgColor
            cell.statusButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
            cell.statusButton.snp.remakeConstraints { make in
                make.top.equalTo(cell.holderView).offset(10)
                make.right.equalTo(cell.holderView).offset(-10)
            }
            cell.statusButton.tintColor = .white
            cell.statusButton.layer.cornerRadius = 10
            cell.setupProducts()
            return cell
        } else {
            cell.products = ["Product 1"]
            cell.shopNameLabel.text = "My ringtones shop"
            cell.statusButton.setTitle("Completed", for: .normal)
            cell.statusButton.tintColor = .systemGreen
            cell.setupProducts()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
