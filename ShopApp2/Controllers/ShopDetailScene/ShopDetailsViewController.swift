//
//  ShopDetailsViewController.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 13.1.22.
//

import UIKit
import SnapKit

class ShopDetailsViewController: UIViewController {
    
    var navigationView: NavigationView!
    var shop: Shop!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2, height: self.view.frame.size.width / 2.2)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShopDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ShopDetailsHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.register(SeeAllItemsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header2")
        self.view.addSubview(collectionView)
        
        navigationView = NavigationView()
        navigationView.delegate = self
        navigationView.configure(title: shop.name, backButton: true)
        self.view.addSubview(navigationView)
    }
    
    func setupConstraints() {
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(5)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ShopDetailsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return shop.products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShopDetailsCollectionViewCell
        
        cell.setupCell(imgURL: shop.products[indexPath.row].imageURLs[0])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let headerView = self.collectionView.dequeueReusableSupplementaryView(
                ofKind:  UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "header",
                for: indexPath) as! ShopDetailsHeaderCollectionReusableView
            
            let url = URL(string: shop.coverImageURL)
            headerView.shopImage.kf.setImage(with: url)
            
            return headerView
        } else {
            let headerView = self.collectionView.dequeueReusableSupplementaryView(
                ofKind:  UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "header2",
                for: indexPath) as! SeeAllItemsCollectionReusableView
            
            return headerView
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: self.view.frame.size.width , height: self.view.frame.size.height / 3)
        } else {
            return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height / 13)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2 - 10 , height: self.view.frame.size.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = self.shop.products[indexPath.row]
        let productDetailsVC = ProductDetailViewController()
        productDetailsVC.product = selectedProduct
        productDetailsVC.shop = self.shop
        
        self.navigationController?.pushViewController(productDetailsVC, animated: true)
    }
}

//MARK: - BACK BUTTON DELEGATE
extension ShopDetailsViewController: NavigationViewDelegate {
    
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
