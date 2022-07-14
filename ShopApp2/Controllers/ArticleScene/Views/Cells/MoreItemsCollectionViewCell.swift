//
//  MoreItemsCollectionViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 1.2.22.
//

import UIKit

class MoreItemsCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var imageName: UILabel!
    var holderView: UIView!
    var helperView: UIView!
    
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
        helperView.addSubview(imageView)
        
        imageName = UILabel()
        helperView.addSubview(imageName)
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        helperView.snp.makeConstraints { make in
            make.edges.equalTo(holderView)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(helperView)
        }
    }
    
    func setupCell(product: Product) {
        let url = URL(string: product.imageURLs[0])
        imageView.kf.setImage(with: url)
        imageName.text = product.name
    }
    
}
