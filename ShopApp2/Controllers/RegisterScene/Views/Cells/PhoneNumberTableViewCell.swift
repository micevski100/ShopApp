//
//  PhoneNumberTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 14.2.22.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell {
    
    var prefixTextfield: UITextField!
    var prefixBottomLine: CALayer!
    var phoneNumberTextField: UITextField!
    var phoneNumberBottomLine: CALayer!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        prefixTextfield = UITextField()
        prefixTextfield.borderStyle = UITextField.BorderStyle.none
        prefixTextfield.text = "+41"
        
        phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.borderStyle = UITextField.BorderStyle.none
        
        prefixBottomLine = CALayer()
        prefixBottomLine.frame = CGRect(x: 0.0, y: self.contentView.bounds.height - 10, width: self.contentView.bounds.width / 6, height: 1.5)
        prefixBottomLine.backgroundColor = UIColor.black.cgColor
        prefixTextfield.layer.addSublayer(prefixBottomLine)
        
        phoneNumberBottomLine = CALayer()
        phoneNumberBottomLine.frame = CGRect(x: 0.0, y: self.contentView.bounds.height - 10, width: self.contentView.bounds.width, height: 1.5)
        phoneNumberBottomLine.backgroundColor = UIColor.black.cgColor
        phoneNumberTextField.layer.addSublayer(phoneNumberBottomLine)
        
        contentView.addSubview(prefixTextfield)
        contentView.addSubview(phoneNumberTextField)
    }
    
    func setupConstraints() {
        prefixTextfield.snp.makeConstraints { make in
            make.top.left.equalTo(contentView).offset(10)
            make.width.height.equalTo(45)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(prefixTextfield.snp.right).offset(20)
            make.right.equalTo(contentView).offset(-20)
        }
    }
}
