//
//  ArticleTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 31.1.22.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    var product: Product!
    var productNameLabel: UILabel!
    var productDescriptionLabel: UILabel!
    var likeButton: UIButton!
    var profileImageView: UIImageView!
    var itemFromLabel: UILabel!
    var contactButton: UIButton!
    var commmentsButton: UIButton!
    var usernameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        productNameLabel = UILabel()
        self.contentView.addSubview(productNameLabel)
        
        productDescriptionLabel = UILabel()
        productDescriptionLabel.lineBreakMode = .byWordWrapping
        productDescriptionLabel.numberOfLines = 0
        self.contentView.addSubview(productDescriptionLabel)
        
        likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        self.contentView.addSubview(likeButton)
        
        itemFromLabel = UILabel()
        itemFromLabel.text = "Item from"
        self.contentView.addSubview(itemFromLabel)
        
        profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.clipsToBounds = true
        self.contentView.addSubview(profileImageView)
        
        contactButton = UIButton()
        contactButton.configuration = .bordered()
        contactButton.configuration?.baseForegroundColor = .black
        contactButton.configuration?.baseBackgroundColor = .clear
        contactButton.layer.borderWidth = 1
        contactButton.layer.cornerRadius = 10
        contactButton.configuration?.title = "Contact"
        self.contentView.addSubview(contactButton)
        
        commmentsButton = UIButton()
        commmentsButton.configuration = .bordered()
        commmentsButton.configuration?.baseForegroundColor = .black
        commmentsButton.configuration?.baseBackgroundColor = .clear
        commmentsButton.layer.borderWidth = 1
        commmentsButton.layer.cornerRadius = 10
        commmentsButton.configuration?.title = "Comments"
        self.contentView.addSubview(commmentsButton)
        
        usernameLabel = UILabel()
        usernameLabel.text = "User1234"
        self.contentView.addSubview(usernameLabel)
    }
    
    func setupConstraints() {
        productNameLabel.snp.makeConstraints { make in
            make.top.left.equalTo(self.contentView).offset(20)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(20)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
        }
        
        itemFromLabel.snp.makeConstraints { make in
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(20)
            make.left.equalTo(self.contentView).offset(20)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(itemFromLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(20)
            make.height.width.equalTo(contentView.frame.size.height)
        }
        
        contactButton.snp.makeConstraints { make in
            make.top.equalTo(itemFromLabel.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(10)
            make.width.equalTo(self.contentView.frame.size.width / 2)
        }
        
        commmentsButton.snp.makeConstraints { make in
            make.top.equalTo(itemFromLabel.snp.bottom).offset(10)
            make.left.equalTo(contactButton.snp.right).offset(10)
            make.width.equalTo(self.contentView.frame.size.width / 2)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(20)
        }
    }
    
    func setupCell(product: Product) {
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.description
    }
}
