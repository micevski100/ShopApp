//
//  CartViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 27.1.22.
//

import UIKit

class CartViewController: UIViewController{
    
    var items: [Product]!
    var navbar: NavigationView!
    var tableView: UITableView!
    var checkoutView: CheckoutView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        setupProducts()
        setupViews()
        setupConstraints()
    }

    
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        
        navbar = NavigationView()
        navbar.delegate = self
        navbar.configure(title: "Cart", backButton: true)
        navbar.cartButton.snp.removeConstraints()
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableView = UITableView()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        checkoutView = CheckoutView()
        self.view.addSubview(checkoutView)
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(checkoutView.snp.top)
        }
        
        checkoutView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(4)
        }
    }
    
    func setupProducts() {
        let product1ImgURLs = ["https://ae01.alicdn.com/kf/HTB11J9cX2WG3KVjSZFgq6zTspXa1/Laser-Level-12-Lines-3D-Self-Leveling-360-Horizontal-And-Vertical-Cross-Super-Powerful-Green-Laser.jpg_50x50.jpg_.webp",
        "https://ae01.alicdn.com/kf/HTB1f9OiX8Cw3KVjSZFuq6AAOpXa1/Laser-Level-12-Lines-3D-Self-Leveling-360-Horizontal-And-Vertical-Cross-Super-Powerful-Green-Laser.jpg_50x50.jpg_.webp"]
        let product1 = Product(name: "Product1", imageURLs: product1ImgURLs, description: "sad")
        
        let product2ImgURLs = ["https://ae01.alicdn.com/kf/H0b5b5f86aba94579b457668b8bfb819cX/XUHAN-Ball-Nose-End-Mill-Tungsten-Carbide-Cutter-CNC-Router-Bit-Milling-Tool-R0-5-6mm.jpg_50x50.jpg_.webp", "https://ae01.alicdn.com/kf/H7f29bfc4a2c54a00854c999726b8cc2cc/XUHAN-Ball-Nose-End-Mill-Tungsten-Carbide-Cutter-CNC-Router-Bit-Milling-Tool-R0-5-6mm.jpg_50x50.jpg_.webp"]
        let product2 = Product(name: "Product2", imageURLs: product2ImgURLs, description: "sad")
        
        let product3ImgURLs = ["https://ae01.alicdn.com/kf/HLB1fHz1XNrvK1RjSszeq6yObFXaX/Oral-Irrigator-USB-Rechargeable-Water-Flosser-Portable-Dental-Water-Jet-300ML-Water-Tank-Waterproof-Teeth-Cleaner.jpg_50x50.jpg_.webp", "https://ae01.alicdn.com/kf/HTB1jepktxuTBuNkHFNRq6A9qpXak/Oral-Irrigator-USB-Rechargeable-Water-Flosser-Portable-Dental-Water-Jet-300ML-Water-Tank-Waterproof-Teeth-Cleaner.jpg_50x50.jpg_.webp"]
        let product3 = Product(name: "Product2", imageURLs: product3ImgURLs, description: "sad")
        
        let product4ImgURLs = ["https://ae01.alicdn.com/kf/H73f264b0b7f942ec914a6874c12e4fefl/Chenille-Hand-Towels-Kitchen-Bathroom-Hand-Towel-Ball-with-Hanging-Loops-Quick-Dry-Soft-Absorbent-Microfiber.jpg_50x50.jpg_.webp", "https://ae01.alicdn.com/kf/Hceb5539b86314a6fbfdf94832e7bd874J/Chenille-Hand-Towels-Kitchen-Bathroom-Hand-Towel-Ball-with-Hanging-Loops-Quick-Dry-Soft-Absorbent-Microfiber.jpg_50x50.jpg_.webp"]
        let product4 = Product(name: "Product2", imageURLs: product4ImgURLs, description: "sad")
        
        items = [product1, product2, product3, product4]
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartTableViewCell
        cell.setupCell(product: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 5
    }
}

extension CartViewController: NavigationViewDelegate {
    func notificationsButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        
    }
    
    func backButtonTapped() {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    func cartButtonTapped() {
        
    }
}
