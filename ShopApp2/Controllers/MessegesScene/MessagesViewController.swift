//
//  MessagesViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 3.2.22.
//

import UIKit

class MessagesViewController: UIViewController {
    
    var navbar: NavigationView!
    var tableView: UITableView!
    var userNames = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        navbar = NavigationView()
        navbar.delegate = self
        navbar.configure(title: "Messages", backButton: true)
        navbar.cartButton.snp.removeConstraints()
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        let header = MessagesHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 8))
        header.setupUsers(users: ["user1", "user2", "user3"])
        
        tableView = UITableView()
        tableView.tableHeaderView = header
        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: "cell")
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
            make.top.equalTo(navbar.snp.bottom)
            make.left.right.bottom.equalTo(self.view)
        }
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MessagesTableViewCell
        
        cell.setupCell(username: userNames[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        vc.username = userNames[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MessagesViewController: NavigationViewDelegate {
    func notificationsButtonTapped() {
        
    }
    
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
}
