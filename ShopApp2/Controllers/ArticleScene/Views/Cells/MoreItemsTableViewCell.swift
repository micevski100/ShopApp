//
//  MoreItemsTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 1.2.22.
//

import UIKit

class MoreItemsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoreItemsCollectionViewCell
        
        
        cell.setupCell(product: DataHolder.products[indexPath.row])
        
        return cell
    }
    
    var moreItemsLabel: UILabel!
    var product: Product!
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
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: self.contentView.frame.size.width / 2.2, height: self.contentView.frame.size.width / 2.2)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoreItemsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.contentView.addSubview(collectionView)
        
        moreItemsLabel = UILabel()
        moreItemsLabel.text = "More items from this seller"
        self.contentView.addSubview(moreItemsLabel)
        
    }
    
    func setupConstraints() {
        moreItemsLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(moreItemsLabel.snp.bottom)
            make.left.right.bottom.equalTo(contentView)
        }
    }
    
    func setupCell(product: Product) {
        self.product = product
    }
}
