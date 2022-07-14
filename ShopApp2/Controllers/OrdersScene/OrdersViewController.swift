//
//  OrdersViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 16.2.22.
//

import UIKit

class OrdersViewController: UIViewController {
    
    var navbar: NavigationView!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        navbar = NavigationView()
        navbar.configure(title: "Orders History", backButton: true)
        navbar.cartButton.removeFromSuperview()
        navbar.delegate = self
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: "cell")
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

extension OrdersViewController: NavigationViewDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func notificationsButtonTapped() {
        
    }
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrdersTableViewCell
        cell.setupCell(orderName: "Order " + String(indexPath.row + 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OrderDetailsViewController()
        let cell = tableView.cellForRow(at: indexPath) as! OrdersTableViewCell
        vc.orderName = cell.orderNameLabel.text
        navigationController?.pushViewController(vc, animated: true)
    }
}
