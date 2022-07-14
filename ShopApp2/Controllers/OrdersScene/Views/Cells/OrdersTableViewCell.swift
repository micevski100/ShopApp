//
//  OrdersTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 16.2.22.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    var holderView: UIView!
    var orderNameLabel: UILabel!
    var totalShippingLabel: UILabel!
    var totalShippingValueLabel: UILabel!
    var totalPriceLabel: UILabel!
    var totalPriceValueLabel: UILabel!
    var dateLabel: UILabel!
    
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
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor.systemGray.cgColor
        holderView.layer.masksToBounds = false
        
        orderNameLabel = UILabel()
        orderNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        holderView.addSubview(orderNameLabel)
        
        totalShippingLabel = UILabel()
        totalShippingLabel.text = "Total shipping"
        holderView.addSubview(totalShippingLabel)
        
        totalPriceLabel = UILabel()
        totalPriceLabel.text = "Total price"
        holderView.addSubview(totalPriceLabel)
        
        totalShippingValueLabel = UILabel()
        totalShippingValueLabel.text = "CHF 15.00"
        holderView.addSubview(totalShippingValueLabel)
        
        totalPriceValueLabel = UILabel()
        totalPriceValueLabel.text = "CHF 700.00"
        holderView.addSubview(totalPriceValueLabel)
        
        dateLabel = UILabel()
        dateLabel.text = "04.02.2022"
        holderView.addSubview(dateLabel)
        
        contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-10)
            make.left.right.equalTo(contentView).inset(10)
        }
        
        orderNameLabel.snp.makeConstraints { make in
            make.top.equalTo(holderView)
            make.left.equalTo(holderView).offset(10)
        }

        totalShippingLabel.snp.makeConstraints { make in
            make.top.equalTo(orderNameLabel.snp.bottom).offset(20)
            make.left.equalTo(holderView).offset(10)
        }

        totalShippingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(orderNameLabel.snp.bottom).offset(20)
            make.right.equalTo(holderView).offset(-10)
        }

        totalPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(totalShippingLabel.snp.bottom).offset(5)
            make.left.equalTo(holderView).offset(10)
        }

        totalPriceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(totalShippingLabel.snp.bottom).offset(5)
            make.right.equalTo(holderView).offset(-10)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(totalPriceLabel.snp.bottom).offset(10)
            make.left.equalTo(holderView).offset(10)
            make.bottom.equalTo(holderView).offset(-10)
        }
    }
    
    func setupCell(orderName: String) {
        orderNameLabel.text = orderName
    }
}
