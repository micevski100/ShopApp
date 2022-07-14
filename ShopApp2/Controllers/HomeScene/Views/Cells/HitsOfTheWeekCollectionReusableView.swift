//
//  HitsOfTheWeekCollectionReusableView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 24.1.22.
//

import UIKit

class HitsOfTheWeekCollectionReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HitsOfTheWeekCollectionViewCell
        
        cell.setupCell(product: self.products[indexPath.row])
        
        return cell
    }
    
    
    var products: [Product]!
    var hitsOfTheWeekLabel: UILabel!
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        hitsOfTheWeekLabel = UILabel()
        hitsOfTheWeekLabel.text = "Hits of the Week"
        self.addSubview(hitsOfTheWeekLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.frame.size.width / 3 - 10, height: self.frame.size.width / 3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.register(HitsOfTheWeekCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        self.addSubview(collectionView)
    }
    
    func setupHeader(products: [Product]) {
        self.products = products
    }
    
    func setupConstraints() {
        hitsOfTheWeekLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(hitsOfTheWeekLabel.snp.bottom)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(5)
            make.bottom.equalTo(self)
        }
    }
}
