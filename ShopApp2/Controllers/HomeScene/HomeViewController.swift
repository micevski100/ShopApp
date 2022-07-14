//
//  HomeViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 24.1.22.
//

import UIKit

extension HomeViewController: NavigationViewDelegate {
    func notificationsButtonTapped() {
        let vc = NotificationsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func backButtonTapped() {
        
    }
    
    func cartButtonTapped() {
        
    }
    
    func messagesButtonTapped() {
        let vc = MessagesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class HomeViewController: UIViewController{
    
    var navBar: NavigationView!
    var collectionView: UICollectionView!
    var categoriesNavigationView: CategoriesNavigationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.view.backgroundColor = .systemGray6
        self.navBar = NavigationView()
        self.navBar.delegate = self
        self.navBar.configure(title: "Home", searchButton: true)
        self.view.addSubview(navBar)
        
        categoriesNavigationView = CategoriesNavigationView()
        categoriesNavigationView.setupButttons(buttonNames: ["All Ads",
                                                             "Man",
                                                             "Woman",
                                                             "Home",
                                                             "Garden",
                                                             "Accessories",
                                                             "Children Baby"])
        self.view.addSubview(categoriesNavigationView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2, height: self.view.frame.size.width / 2.2)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HitsOfTheWeekCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        self.view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        navBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        categoriesNavigationView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(5)
            make.left.right.equalTo(self.view)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesNavigationView.snp.bottom)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        
        cell.setupCell(product: DataHolder.products[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = self.collectionView.dequeueReusableSupplementaryView(
            ofKind:  UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header",
            for: indexPath) as! HitsOfTheWeekCollectionReusableView
        headerView.setupHeader(products: DataHolder.products)
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 4 , height: self.view.frame.size.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ArticleViewController()
        vc.product = DataHolder.products[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 2 - 10 , height: self.view.frame.size.height / 3)
    }
}
