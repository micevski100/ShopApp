//
//  CartTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 27.1.22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    var holderView: UIView!
    var helperView: UIView!
    var productNameLabel: UILabel!
    var productQuantityLabel: UILabel!
    var productSizeLabel: UILabel!
    var productColorLabel: UILabel!
    var productImageView: UIImageView!
    var productPriceLabel: UILabel!
    var removeProductButton: UIButton!
    var productQuantityPlusButton: UIButton!
    var productQuantityToggleLabel: UILabel!
    var productQuantityMinusButton: UIButton!
    var productQuantityToggleCounter = 1
    
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
        holderView = UIView()
        holderView.backgroundColor = .white
        holderView.layer.cornerRadius = 10
        holderView.layer.shadowColor = UIColor.black.cgColor
        holderView.layer.shadowOffset = CGSize(width: 10, height: 10)
        holderView.layer.shadowRadius = 10
        holderView.layer.shadowOpacity = 0.16
        holderView.layer.masksToBounds = false
        
        helperView = UIView()
        helperView.backgroundColor = .white
        helperView.layer.masksToBounds = true
        helperView.layer.cornerRadius = 10
        holderView.addSubview(helperView)
        
        productNameLabel = UILabel()
        helperView.addSubview(productNameLabel)
        
        productQuantityLabel = UILabel()
        productQuantityLabel.text = "Quantity 1"
        helperView.addSubview(productQuantityLabel)
        
        productSizeLabel = UILabel()
        productSizeLabel.text = "Size 36"
        helperView.addSubview(productSizeLabel)
        
        productColorLabel = UILabel()
        productColorLabel.text = "Color Red"
        helperView.addSubview(productColorLabel)
        
        productImageView = UIImageView()
        helperView.addSubview(productImageView)
        
        productPriceLabel = UILabel()
        productPriceLabel.text = "100.00 CHF"
        helperView.addSubview(productPriceLabel)
        
        removeProductButton = UIButton()
        removeProductButton.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        helperView.addSubview(removeProductButton)
        
        productQuantityPlusButton = UIButton()
        productQuantityPlusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        productQuantityPlusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        helperView.addSubview(productQuantityPlusButton)
        
        productQuantityMinusButton = UIButton()
        productQuantityMinusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        productQuantityMinusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        helperView.addSubview(productQuantityMinusButton)
        
        productQuantityToggleLabel = UILabel()
        productQuantityToggleLabel.text = "1"
        helperView.addSubview(productQuantityToggleLabel)
        
        
        self.contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.left.right.equalTo(self.contentView).inset(10)
            make.top.bottom.equalTo(self.contentView).inset(10)
        }
        
        helperView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(holderView)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.left.equalTo(helperView).offset(5)
            make.width.equalTo(self.contentView.frame.size.width / 2)
            make.bottom.equalTo(helperView).offset(-10)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        productQuantityLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(15)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        productSizeLabel.snp.makeConstraints { make in
            make.top.equalTo(productQuantityLabel.snp.bottom).offset(5)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        productColorLabel.snp.makeConstraints { make in
            make.top.equalTo(productSizeLabel.snp.bottom).offset(5)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productColorLabel.snp.bottom).offset(15)
            make.left.equalTo(productImageView.snp.right).offset(10)
        }
        
        removeProductButton.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(5)
            make.right.equalTo(helperView).offset(-10)
        }
        
        productQuantityPlusButton.snp.makeConstraints { make in
            make.bottom.equalTo(helperView.snp.bottom).offset(-5)
            make.right.equalTo(helperView.snp.right).offset(-10)
        }
        
        productQuantityToggleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(helperView.snp.bottom).offset(-5)
            make.right.equalTo(productQuantityPlusButton.snp.left).offset(-5)
        }
        
        productQuantityMinusButton.snp.makeConstraints { make in
            make.bottom.equalTo(helperView.snp.bottom).offset(-5)
            make.right.equalTo(productQuantityToggleLabel.snp.left).offset(-5)
        }
        
    }
    
    func setupCell(product: Product) {
        productNameLabel.text = product.name
        let url = URL(string: product.imageURLs[0])
        productImageView.kf.setImage(with: url)
    }
    
    @objc func minusButtonTapped() {
        productQuantityToggleCounter -= 1
        if productQuantityToggleCounter < 0 {
            productQuantityToggleCounter = 0
        }
        productQuantityToggleLabel.text = String(productQuantityToggleCounter)
        productQuantityLabel.text = "Quantity " + String(productQuantityToggleCounter)
    }
    
    @objc func plusButtonTapped() {
        productQuantityToggleCounter += 1
        productQuantityToggleLabel.text = String(productQuantityToggleCounter)
        productQuantityLabel.text = "Quantity " + String(productQuantityToggleCounter)
    }
}
