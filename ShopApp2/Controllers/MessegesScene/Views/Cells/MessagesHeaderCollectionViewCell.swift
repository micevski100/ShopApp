//
//  MessagesHeaderCollectionViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 7.2.22.
//

import UIKit

class MessagesHeaderCollectionViewCell: UICollectionViewCell {
    
    var profileImageView: UIImageView!
    var usernameLabel: UILabel!
    var activeCircleImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.clipsToBounds = true
        self.contentView.addSubview(profileImageView)
        
        activeCircleImageView = UIImageView()
        activeCircleImageView.image = UIColor.green.image(CGSize(width: contentView.frame.size.height / 4, height: contentView.frame.size.height / 4))
        activeCircleImageView.layer.borderWidth = 1.0
        activeCircleImageView.layer.masksToBounds = false
        activeCircleImageView.layer.cornerRadius = activeCircleImageView.image!.size.width / 2
        activeCircleImageView.clipsToBounds = true
        contentView.addSubview(activeCircleImageView)
        
        usernameLabel = UILabel()
        self.contentView.addSubview(usernameLabel
        )
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.center.equalTo(contentView.center)
            make.width.height.equalTo(contentView.snp.height)
        }
        
        activeCircleImageView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.right.equalTo(profileImageView.snp.right)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
    }
    
    func setupCell(username: String) {
        usernameLabel.text = username
    }
}
