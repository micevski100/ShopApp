//
//  OrderDetailsTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 16.2.22.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell {
    
    var holderView: UIView!
    var shopNameLabel: UILabel!
    var statusButton: UIButton!
    var products: [String]!
    var totalPriceLabel: UILabel!
    var totalPriceValueLabel: UILabel!
    var totalShippingLabel: UILabel!
    var totalShippingValueLabel: UILabel!
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
        contentView.backgroundColor = .systemGray6
        
        holderView = UIView()
        holderView.backgroundColor = .white
        holderView.layer.cornerRadius = 10
        holderView.layer.shadowColor = UIColor.black.cgColor
        holderView.layer.shadowOffset = CGSize(width: 10, height: 10)
        holderView.layer.shadowRadius = 10
        holderView.layer.shadowOpacity = 0.16
        holderView.layer.masksToBounds = false
        
        shopNameLabel = UILabel()
        shopNameLabel.text = "Jusepe Shop"
        shopNameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        holderView.addSubview(shopNameLabel)
        
        statusButton = UIButton(type: .system)
        statusButton.setTitle("Confirmed", for: .normal)
        statusButton.titleLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        statusButton.tintColor = .orange
        holderView.addSubview(statusButton)
        
        totalPriceLabel = UILabel()
        totalPriceLabel.text = "Total price"
        holderView.addSubview(totalPriceLabel)
        
        totalShippingLabel = UILabel()
        totalShippingLabel.text = "Total shipping"
        holderView.addSubview(totalShippingLabel)
        
        totalPriceLabel = UILabel()
        totalPriceLabel.text = "Total price"
        holderView.addSubview(totalPriceLabel)
        
        totalPriceValueLabel = UILabel()
        totalPriceValueLabel.text = "CHF 58.00"
        holderView.addSubview(totalPriceValueLabel)
        
        totalShippingValueLabel = UILabel()
        totalShippingValueLabel.text = "CHF 0.00"
        holderView.addSubview(totalShippingValueLabel)
        
        bottomLine = UIView()
        bottomLine.backgroundColor = .black
        holderView.addSubview(bottomLine)
        
        contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        shopNameLabel.snp.makeConstraints { make in
            make.top.equalTo(holderView).offset(10)
            make.left.equalTo(holderView).offset(10)
        }
        
        statusButton.snp.makeConstraints { make in
            make.top.equalTo(holderView).offset(5)
            make.right.equalTo(holderView).offset(-10)
        }
        
        totalShippingLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomLine.snp.bottom).offset(10)
            make.left.equalTo(holderView).offset(10)
        }
        
        totalShippingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomLine.snp.bottom).offset(10)
            make.right.equalTo(holderView).offset(-10)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(totalShippingLabel.snp.bottom).offset(10)
            make.left.equalTo(holderView).offset(10)
            make.bottom.equalTo(holderView).offset(-10)
        }
        
        totalPriceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(totalShippingLabel.snp.bottom).offset(10)
            make.right.equalTo(holderView).offset(-10)
        }
        
        
        
    }
    
    func setupProducts() {
        var prevProduct: UILabel!
        
        for i in 0..<products.count {
            let productLabel = UILabel()
            productLabel.text = products[i]
            self.holderView.addSubview(productLabel)
            
            let productPriceLabel = UILabel()
            productPriceLabel.text = "1 x CHF 20.00"
            self.holderView.addSubview(productPriceLabel)
            
            if products.count == 1 {
                productLabel.snp.makeConstraints { make in
                    make.top.equalTo(statusButton.snp.bottom).offset(10)
                    make.left.equalTo(holderView).offset(10)
                }
                productPriceLabel.snp.makeConstraints { make in
                    make.top.equalTo(statusButton.snp.bottom).offset(10)
                    make.right.equalTo(holderView).offset(-10)
                }
                bottomLine.snp.makeConstraints { make in
                    make.top.equalTo(productLabel.snp.bottom).offset(5)
                    make.left.right.equalTo(holderView).inset(10)
                    make.height.equalTo(1)
                }
                
                
            } else if i == 0 {
                productLabel.snp.makeConstraints { make in
                    make.top.equalTo(statusButton.snp.bottom).offset(10)
                    make.left.equalTo(holderView).offset(10)
                }
                productPriceLabel.snp.makeConstraints { make in
                    make.top.equalTo(statusButton.snp.bottom).offset(10)
                    make.right.equalTo(holderView).offset(-10)
                }
            } else if i == products.count - 1 {
                productLabel.snp.makeConstraints { make in
                    make.top.equalTo(prevProduct.snp.bottom).offset(5)
                    make.left.equalTo(holderView).offset(10)
                }
                
                productPriceLabel.snp.makeConstraints { make in
                    make.top.equalTo(prevProduct.snp.bottom).offset(5)
                    make.right.equalTo(holderView).offset(-10)
                }
                
                
                bottomLine.snp.makeConstraints { make in
                    make.top.equalTo(productLabel.snp.bottom).offset(5)
                    make.left.right.equalTo(holderView).inset(10)
                    make.height.equalTo(1)
                }
            } else {
                productLabel.snp.makeConstraints { make in
                    make.top.equalTo(prevProduct.snp.bottom).offset(5)
                    make.left.equalTo(holderView).offset(10)
                }
                productPriceLabel.snp.makeConstraints { make in
                    make.top.equalTo(prevProduct.snp.bottom).offset(5)
                    make.right.equalTo(holderView).offset(-10)
                }
            }
            
            prevProduct = productLabel
        }
    }
}

