//
//  MessagesTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 3.2.22.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var usernameLabel: UILabel!
    var lastMessageLabel: UILabel!
    var lastMessageDateLabel: UILabel!

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
        
        usernameLabel = UILabel()
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.contentView.addSubview(usernameLabel)
        
        lastMessageLabel = UILabel()
        lastMessageLabel.text = "Hello"
        self.contentView.addSubview(lastMessageLabel)
        
        
        lastMessageDateLabel = UILabel()
        lastMessageDateLabel.text = "2 months ago"
        self.contentView.addSubview(lastMessageDateLabel)
        
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(contentView.snp.height).dividedBy(1.2)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        lastMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        lastMessageDateLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
    }
    
    func setupCell(username: String) {
        usernameLabel.text = username
    }

}
