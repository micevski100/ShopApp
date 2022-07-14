//
//  HomeCollectionViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 24.1.22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var holderView: UIView!
    var helperView: UIView!
    var imageView: UIImageView!
    var heartButton: UIButton!
    var productNameLabel: UILabel!
    var productPriceLabel: UILabel!
    var contactButton: UIButton!
    var numberOfHeartsLabel: UILabel!
    var userProfileImage: UIImageView!
    var userProfileLabel: UILabel!
    var moreInfoButton: UIButton!
    var product: Product!
    
    
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
        helperView.addSubview(productNameLabel)
        
        productPriceLabel = UILabel()
        helperView.addSubview(productPriceLabel)
        
        numberOfHeartsLabel = UILabel()
        helperView.addSubview(numberOfHeartsLabel)
        
        contactButton = UIButton(type: .system)
        contactButton.configuration = .bordered()
        contactButton.configuration?.baseForegroundColor = .black
        contactButton.setTitle("Contact", for: .normal)
        contactButton.configuration?.cornerStyle = .medium
        helperView.addSubview(contactButton)
        
        userProfileImage = UIImageView()
        userProfileImage.image = UIImage(systemName: "person.fill")
        helperView.addSubview(userProfileImage)
        
        userProfileLabel = UILabel()
        userProfileLabel.text = "User1234"
        helperView.addSubview(userProfileLabel)
        
        moreInfoButton = UIButton()
        moreInfoButton.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        helperView.addSubview(moreInfoButton)
        
        
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        helperView.snp.makeConstraints { make in
            make.edges.equalTo(holderView)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(holderView).offset(-10)
            make.left.equalTo(holderView).offset(10)
        }
        
        contactButton.snp.makeConstraints { make in
            make.bottom.equalTo(holderView).offset(-5)
            make.right.equalTo(holderView.snp.right).offset(-5)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(productPriceLabel.snp.top).offset(-10)
            make.left.equalTo(helperView).offset(10)
        }
        
        numberOfHeartsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(productPriceLabel.snp.top).offset(-10)
            make.right.equalTo(helperView.snp.right).offset(-10)
        }
        
        heartButton.snp.makeConstraints { make in
            make.bottom.equalTo(productPriceLabel.snp.top).offset(-10)
            make.right.equalTo(numberOfHeartsLabel.snp.left).offset(-10)
        }
        
        userProfileImage.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.left.equalTo(helperView).offset(10)
        }
        
        userProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.left.equalTo(userProfileImage.snp.right).offset(10)
        }
        
        moreInfoButton.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.right.equalTo(helperView.snp.right).offset(-10)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(userProfileImage.snp.bottom).offset(10)
            make.left.right.equalTo(helperView)
            make.bottom.equalTo(heartButton.snp.top).offset(-10)
        }
    }
    
    func setupCell(product: Product) {
        if let url = URL(string: product.imageURLs[0])  {
            imageView.kf.setImage(with: url)
        }
        self.product = product
        productPriceLabel.text = "100 CHF"
        productNameLabel.text = product.name
        numberOfHeartsLabel.text = "0"
    }
    
}
