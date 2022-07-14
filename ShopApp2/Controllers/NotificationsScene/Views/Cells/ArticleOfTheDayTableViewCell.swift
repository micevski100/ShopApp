//
//  NotificationsTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 7.2.22.
//

import UIKit

class ArticleOfTheDayTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var senderLabel: UILabel!
    var dateLabel: UILabel!
    var messageLabel: UILabel!
    var articleImageView: UIImageView!

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
        profileImageView.image = UIColor.black.image(CGSize(width: contentView.frame.height, height: contentView.frame.height))
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.image!.size.width / 2
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        
        articleImageView = UIImageView()
        articleImageView.image = UIImage(systemName: "photo")
        contentView.addSubview(articleImageView)
        
        senderLabel = UILabel()
        senderLabel.text = "Teorem Admin"
        senderLabel.font = UIFont(name: senderLabel.font.fontName, size: 20)
        contentView.addSubview(senderLabel)
        
        dateLabel = UILabel()
        dateLabel.text = "4 months ago  |  Your article is article of the day."
        dateLabel.font = UIFont(name: senderLabel.font.fontName, size: 13)
        contentView.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        senderLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(senderLabel.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(10)
        }
        
        articleImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.height.equalTo(contentView.frame.height)
        }
    }

}
