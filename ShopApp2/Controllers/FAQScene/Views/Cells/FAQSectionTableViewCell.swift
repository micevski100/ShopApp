//
//  FAQTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 15.2.22.
//

import UIKit

class FAQSectionTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var detailsImageView: UIImageView!
    var detailsLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.selectionStyle = .none
        nameLabel = UILabel()
        nameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(nameLabel)
        
        detailsLabel = UILabel()
        detailsLabel.numberOfLines = 0
        detailsLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(detailsLabel)
        
        detailsImageView = UIImageView()
        detailsImageView.image = UIImage(systemName: "chevron.right")
        self.contentView.addSubview(detailsImageView)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(detailsImageView.snp.left).offset(-10)
            
        }
        
        detailsImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.width.height.equalTo(25)
        }
        
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    func setupCell(sectionName: String) {
        nameLabel.text = sectionName
    }
}
