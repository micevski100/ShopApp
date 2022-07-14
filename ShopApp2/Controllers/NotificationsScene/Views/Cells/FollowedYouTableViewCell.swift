//
//  FollowedYouTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 7.2.22.
//

import UIKit

class FollowedYouTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var senderLabel: UILabel!
    var dateLabel: UILabel!
    var followingButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        senderLabel = UILabel()
        senderLabel.text = "User 1"
        senderLabel.font = UIFont(name: senderLabel.font.fontName, size: 20)
        self.contentView.addSubview(senderLabel)
        
        dateLabel = UILabel()
        dateLabel.text = "4 months ago  |  Follow you"
        dateLabel.font = UIFont(name: senderLabel.font.fontName, size: 13)
        contentView.addSubview(dateLabel)
        
        followingButton = UIButton()
        followingButton.configuration = .plain()
        followingButton.setTitle("Following", for: .normal)
        followingButton.tintColor = .black
        followingButton.layer.borderWidth = 1
        followingButton.layer.borderColor = UIColor.black.cgColor
        followingButton.layer.cornerRadius = 15
        contentView.addSubview(followingButton)
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(contentView.frame.size.height)
        }
        
        senderLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(senderLabel.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        followingButton.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
