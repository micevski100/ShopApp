//
//  DeliveryInformationViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 9.2.22.
//

import UIKit

class DeliveryInformationViewController: UIViewController {
    
    var navbar: NavigationView!
    var tableView: UITableView!
    var addAddressButton: UIButton!
    var locations = ["Bratstvo Edinstvo 9", "Betovenova 36"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        self.tabBarController?.tabBar.isHidden = true
        
        navbar = NavigationView()
        navbar.delegate = self
        navbar.configure(title: "Delivery Address", backButton: true)
        navbar.cartButton.snp.removeConstraints()
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.register(DeliveryInformationTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        self.view.addSubview(tableView)
        
        addAddressButton = UIButton()
        addAddressButton.setTitle("Add Address", for: .normal)
        addAddressButton.backgroundColor = .black
        addAddressButton.tintColor = .white
        addAddressButton.layer.borderWidth = 1
        addAddressButton.layer.borderColor = UIColor.black.cgColor
        addAddressButton.layer.cornerRadius = 10
        addAddressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        addAddressButton.addTarget(self, action: #selector(addAddressAction), for: .touchUpInside)
        self.view.addSubview(addAddressButton)
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        addAddressButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-40)
            make.left.right.equalTo(self.view).inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom).offset(10)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(addAddressButton.snp.top)
        }
    }
    
    @objc func addAddressAction() {
        let vc = AddAddresssViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func editButtonAction(_ sender: UIButton){
        let alert = UIAlertController()
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default , handler:{ (UIAlertAction) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Disable", style: .default , handler:{ (UIAlertAction) in
            
        }))
    

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction) in
            self.locations.remove(at: sender.tag)
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
            
        }))

        self.present(alert, animated: true, completion: nil)
    }
}

extension DeliveryInformationViewController: NavigationViewDelegate {
    func backButtonTapped() {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func notificationsButtonTapped() {
        
    }
}


extension DeliveryInformationViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DeliveryInformationTableViewCell
        
        cell.setupCell(location: locations[indexPath.row])
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editButtonAction(_:)), for: .touchUpInside)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 12
    }
}

extension DeliveryInformationViewController: AddAdressProtocol {
    func saveAddress(adress: String, city: String, postalCode: String, country: String) {
        let text = adress + ", " + city + " " + postalCode + ", " + country
        if !locations.isEmpty && !locations.contains(text) {
            locations.append(text)
            tableView.reloadData()
        }
    }
}
