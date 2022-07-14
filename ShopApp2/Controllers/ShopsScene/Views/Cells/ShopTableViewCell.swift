//
//  ShopTableViewCell.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 14.1.22.
//

import UIKit
import Kingfisher

class ShopTableViewCell: UITableViewCell {
    var holderView: UIView!
    var helperView: UIView!
    var shopImageView: UIImageView!
    var shopNameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        
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
        
        shopImageView = UIImageView()
        shopImageView.contentMode = .scaleAspectFill
        shopImageView.layer.masksToBounds = true
        helperView.addSubview(shopImageView)
        
        shopNameLabel = UILabel()
        shopNameLabel.backgroundColor = .white
        shopNameLabel.textAlignment = .center
        shopNameLabel.font = UIFont(name: shopNameLabel.font.fontName, size: 30)
        helperView.addSubview(shopNameLabel)
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(15)
            make.bottom.equalTo(contentView).inset(15)
            make.top.equalTo(contentView)
        }
        
        helperView.snp.makeConstraints { make in
            make.edges.equalTo(holderView)
        }
        
        shopNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(helperView).inset(5)
            make.left.right.equalTo(helperView).inset(10)
        }
        
        shopImageView.snp.makeConstraints { make in
            make.top.equalTo(holderView)
            make.left.right.equalTo(holderView)
            make.bottom.equalTo(shopNameLabel.snp.top).offset(-5)
        }
    }
}

extension ShopTableViewCell {
    func configureCell(shop: Shop) {
        let url = URL(string: shop.coverImageURL)
        shopImageView.kf.setImage(with: url)
        shopNameLabel.text = shop.name
    }
}
