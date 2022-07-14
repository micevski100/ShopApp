//
//  RegisterTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 12.2.22.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    var textField: UITextField!
    var bottomLine: CALayer!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        
        
        textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.none
        
        bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.contentView.bounds.height - 10, width: self.contentView.bounds.width, height: 1.5)
        bottomLine.backgroundColor = UIColor.black.cgColor
        
        textField.layer.addSublayer(bottomLine)
        self.contentView.addSubview(textField)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.right.equalTo(contentView).inset(10)
        }
    }
    
    func setupCell(text: String) {
        textField.placeholder = text
    }
}
