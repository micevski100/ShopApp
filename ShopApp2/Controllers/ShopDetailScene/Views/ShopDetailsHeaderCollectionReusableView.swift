//
//  ShopDetailsCollectionReusableView.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 17.1.22.
//

import UIKit

class ShopDetailsHeaderCollectionReusableView: UICollectionReusableView {
    
    var imgURL: String!
    var shopImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        shopImage = UIImageView()
        shopImage.contentMode = .scaleToFill
        shopImage.layer.masksToBounds = true
        self.addSubview(shopImage)
    }
    
    func setupConstraints() {
        shopImage.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}
