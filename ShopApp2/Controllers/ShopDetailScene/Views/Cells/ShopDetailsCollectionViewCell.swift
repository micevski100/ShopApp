//
//  ShopDetailsCollectionViewCell.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 17.1.22.
//

import UIKit

class ShopDetailsCollectionViewCell: UICollectionViewCell {
    var holderView: UIView!
    var helperView: UIView!
    var imageView: UIImageView!
    var heartButton: UIButton!
    var productNameLabel: UILabel!
    var productPrice: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.contentView.backgroundColor = .clear
        
        holderView = UIView()
        holderView.backgroundColor = .white
        holderView.layer.cornerRadius = 10
        holderView.layer.shadowColor = UIColor.black.cgColor
        holderView.layer.shadowOffset = CGSize(width: 10, height: 10)
        holderView.layer.shadowRadius = 10
        holderView.layer.shadowOpacity = 0.16
        holderView.layer.masksToBounds = false
        
        helperView = UIView()
        helperView.backgroundColor = .white
        helperView.layer.masksToBounds = true
        helperView.layer.cornerRadius = 10
        holderView.addSubview(helperView)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        helperView.addSubview(imageView)

        heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        helperView.addSubview(heartButton)
        
        productNameLabel = UILabel()
        productNameLabel.numberOfLines = 1
        productNameLabel.text = "Product Name"
        productNameLabel.textAlignment = .center
        helperView.addSubview(productNameLabel)
        
        productPrice = UILabel()
        productPrice.text = "CHF 100"
        productPrice.numberOfLines = 1
        productPrice.textAlignment = .center
        helperView.addSubview(productPrice)
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.left.right.equalTo(self.contentView).inset(10)
            make.top.bottom.equalTo(self.contentView).inset(10)
        }
        
        helperView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(holderView)
        }
        
        productPrice.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self.helperView).inset(10)
            make.height.equalTo(30)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.productPrice.snp.top).offset(-10)
            make.left.right.equalTo(self.helperView).inset(10)
            make.height.equalTo(30)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.holderView)
            make.bottom.equalTo(self.productNameLabel.snp.top).offset(-10)
        }
    }
    
    func setupCell(imgURL: String) {
        if let url = URL(string: imgURL)  {
            imageView.kf.setImage(with: url)
        }
    }
    
}
