//
//  SeeAllItemsCollectionReusableView.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 17.1.22.
//

import UIKit

class SeeAllItemsCollectionReusableView: UICollectionReusableView {
    
    var latestProductsLabel: UILabel!
    var seeAllButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        latestProductsLabel = UILabel()
        latestProductsLabel.text = "Latest Products"
        self.addSubview(latestProductsLabel)
        
        seeAllButton = UIButton(type: .system)
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.tintColor = .black
        self.addSubview(seeAllButton)
    }
    
    func setupConstraints() {
        latestProductsLabel.snp.makeConstraints { make in
            make.top.left.equalTo(self).offset(5)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.right.equalTo(self.snp.right).offset(-10)
        }
    }
}
