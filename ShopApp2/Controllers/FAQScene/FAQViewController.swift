//
//  FAQViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 15.2.22.
//

import UIKit

class FAQSection {
    
    let title: String
    var isOpened: Bool = false
    
    init(title: String, isOpened: Bool = false) {
        self.title = title
        self.isOpened = isOpened
    }
}

class FAQViewController: UIViewController {

    var navbar: NavigationView!
    var tableView: UITableView!
    var sections = [
        FAQSection(title: "What is the Spot ?"),
        FAQSection(title: "What can we sell on the Spot by Teorem ?"),
        FAQSection(title: "How to buy an item on the Spot ?"),
        FAQSection(title: "How to publish an article on the Spot ?"),
        FAQSection(title: "How many ads can I post ?"),
        FAQSection(title: "What are the benefits of the TRIBE subscription at CHF 7 per month ?"),
        FAQSection(title: "How to report a suspicious article ?"),
        FAQSection(title: "What items cannot be sold on Teorem ?"),
        FAQSection(title: "How do I manage my ads ?"),
        FAQSection(title: "Who pays for the shipping cost ?")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        self.view.backgroundColor = .systemGray6
        navbar = NavigationView()
        navbar.delegate = self
        navbar.configure(title: "FAQ", backButton: true)
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.register(FAQSectionTableViewCell.self, forCellReuseIdentifier: "cell")
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
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}

extension FAQViewController: NavigationViewDelegate{
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

extension FAQViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FAQSectionTableViewCell
        
        cell.setupCell(sectionName: sections[indexPath.row].title)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.row].isOpened = !sections[indexPath.row].isOpened
        
        if sections[indexPath.row].isOpened  {
            
            let cell = tableView.cellForRow(at: indexPath) as! FAQSectionTableViewCell
            cell.detailsImageView.image = UIImage(systemName: "chevron.down")
            cell.detailsLabel.text = "This is a space for individuals dedicated to second hand fashion for children and adults. Sell your items by creating your shop now."
            
            tableView.reloadRows(at: [indexPath], with: .none)
        } else {
            let cell = tableView.cellForRow(at: indexPath) as! FAQSectionTableViewCell
            cell.detailsImageView.image = UIImage(systemName: "chevron.right")
            cell.detailsLabel.text = ""
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
