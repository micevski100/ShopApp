//
//  RelatedProductsTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 24.1.22.
//

import UIKit

class RelatedProductsTableViewCell: UITableViewCell {
    
    var products: [Product]!
    var relatedItemsLabel: UILabel!
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.frame.size.width / 3, height: self.frame.size.width / 3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RelatedProdutCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.contentView.addSubview(collectionView)
        
        relatedItemsLabel = UILabel()
        relatedItemsLabel.text = "Related Items:"
        relatedItemsLabel.font = UIFont(name: relatedItemsLabel.font.fontName, size: 25)
        self.contentView.addSubview(relatedItemsLabel)
    }
    
    func setupConstraints() {
        
        relatedItemsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(20)
            make.left.right.equalTo(contentView).offset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(relatedItemsLabel)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView)
        }
    }
    
    func setupCell(products: [Product]) {
        self.products = products
    }
}

extension RelatedProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width / 3 - 15, height: self.frame.size.width / 3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RelatedProdutCollectionViewCell
        
        cell.setupCell(product: products[indexPath.row])
        
        return cell
    }
}
