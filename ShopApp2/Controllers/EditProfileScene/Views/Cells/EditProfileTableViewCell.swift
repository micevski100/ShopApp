//
//  EditProfileTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 17.2.22.
//

import UIKit

class EditProfileTableViewCell: UITableViewCell {
    
    var label: UILabel!
    var textField: UITextField!
    var bottomLine: UIView!
    
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
        
        label = UILabel()
        label.font =  UIFont(name:"HelveticaNeue-Bold", size: 15)
        label.textColor = UIColor(red: 0.24, green: 0.22, blue: 0.21, alpha: 1.00)
        contentView.addSubview(label)
        
        textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.none
        contentView.addSubview(textField)
        
        bottomLine = UIView()
        bottomLine.backgroundColor = UIColor(red: 0.64, green: 0.67, blue: 0.51, alpha: 1.00)
        contentView.addSubview(bottomLine)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.top.left.equalTo(contentView).offset(10)
            make.width.equalTo(90)
        }
        
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(label.snp.bottom)
            make.left.equalTo(label.snp.right).offset(5)
            make.right.equalTo(contentView).offset(-5)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom)
            make.left.equalTo(textField.snp.left)
            make.right.equalTo(textField.snp.right)
            make.height.equalTo(1)
        }
    }
    
    func setupCell(text: String) {
        label.text = text
        
    }
}
