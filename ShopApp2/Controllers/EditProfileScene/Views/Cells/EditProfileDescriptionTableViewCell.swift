//
//  DescriptionTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 18.2.22.
//

import UIKit

class EditProfileDescriptionTableViewCell: UITableViewCell {
    var descriptionLabel: UILabel!
    var holderView: UIView!
    var descriptionTextField: UITextField!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        contentView.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.95, alpha: 1.00)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Your profile description"
        descriptionLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20)
        contentView.addSubview(descriptionLabel)
        
        holderView = UIView()
        holderView.backgroundColor = UIColor(red: 0.84, green: 0.89, blue: 0.85, alpha: 1.00)
        holderView.layer.cornerRadius = 20
        holderView.layer.masksToBounds = false
        
        descriptionTextField = UITextField()
        descriptionTextField.borderStyle = UITextField.BorderStyle.none
        holderView.addSubview(descriptionTextField)
        
        contentView.addSubview(holderView)
        
        
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.left.equalTo(contentView).offset(20)
        }
        
        holderView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).offset(-20)
            make.width.equalTo(contentView.frame.size.width - 20)
            make.height.equalTo(contentView.frame.size.width / 2 - 20)
        }
        
        descriptionTextField.snp.makeConstraints { make in
            make.top.equalTo(holderView).offset(10)
            make.left.right.equalTo(holderView).inset(10)
            make.bottom.equalTo(holderView).offset(-10)
        }
    }
}
