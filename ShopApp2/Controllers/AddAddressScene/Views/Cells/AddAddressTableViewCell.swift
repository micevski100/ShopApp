//
//  AddAddressTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 10.2.22.
//

import UIKit

class AddAddressTableViewCell: UITableViewCell {
    
    var holderView: UIView!
    var cellNameLabel: UILabel!
    var textField: UITextField!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.contentView.backgroundColor = .systemGray6
        self.selectionStyle = .none
        
        holderView = UIView()
        holderView.backgroundColor = .white
        holderView.layer.cornerRadius = 10
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor.systemGray.cgColor
        holderView.layer.masksToBounds = false
        
        cellNameLabel = UILabel()
        cellNameLabel.text = "Test"
        holderView.addSubview(cellNameLabel)
        
        textField = UITextField()
        textField.backgroundColor = .white
        textField.tintColor = .black
        holderView.addSubview(textField)
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-10)
            make.left.right.equalTo(contentView).inset(10)
        }

        cellNameLabel.snp.makeConstraints { make in
            make.top.equalTo(holderView).offset(10)
            make.bottom.equalTo(textField.snp.top)
            make.left.equalTo(holderView).offset(10)
        }

        textField.snp.makeConstraints { make in
            make.bottom.equalTo(holderView.snp.bottom)
            make.height.equalTo(45)
            make.left.right.equalTo(holderView).inset(10)
        }
        
  
    }
    
    func setupCell(cellName: String) {
        cellNameLabel.text = cellName
    }
    
}
