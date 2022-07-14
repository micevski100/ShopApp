//
//  ImageTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 6.2.22.
//

import UIKit



class ImageTableViewCell: UITableViewCell {
    
    var image: UIImageView!
    
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
        image = UIImageView()
        self.contentView.addSubview(image)
    }
    
    func setupConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.right.equalTo(contentView).offset(-5)
            make.height.width.equalTo(self.contentView.frame.size.width)
        }
    }
    
    func setupCell(image: UIImage) {
        self.image.image = image
    }

}
