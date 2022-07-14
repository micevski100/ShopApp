//
//  ProfileTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 25.1.22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var cellImageView: UIImageView!
    var cellTextLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        cellImageView = UIImageView()
        cellImageView.layer.masksToBounds = true
        cellImageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(cellImageView)
        
        cellTextLabel = UILabel()
        self.contentView.addSubview(cellTextLabel)
    }
    
    func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10)
            make.width.height.equalTo(self.contentView.snp.height).dividedBy(2)
        }
        
        cellTextLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(cellImageView.snp.right).offset(10)
        }
    }
    
    func setupCell(imageName: String, cellText: String) {
        cellImageView.image = UIImage(systemName: imageName)
        cellTextLabel.text = cellText
    }
}
