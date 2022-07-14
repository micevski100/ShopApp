//
//  NotificationsViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 7.2.22.
//

import UIKit


class NotificationsViewController: UIViewController {
    
    var navbar: NavigationView!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        
        navbar = NavigationView()
        navbar.delegate = self
        navbar.configure(title: "Notifications", backButton: true)
        navbar.cartButton.snp.removeConstraints()
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.register(ArticleOfTheDayTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(FollowedYouTableViewCell.self, forCellReuseIdentifier: "cell2")
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
            make.left.right.bottom.equalTo(self.view)
        }
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! FollowedYouTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArticleOfTheDayTableViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 12
    }
}

extension NotificationsViewController: NavigationViewDelegate {
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
