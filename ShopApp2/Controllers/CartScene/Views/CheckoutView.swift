//
//  CheckoutView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 28.1.22.
//

import UIKit

class CheckoutView: UIView {
    
    var subTotalLabel: UILabel!
    var subTotalValueLabel: UILabel!
    var shippingLabel: UILabel!
    var shippingValueLabel: UILabel!
    var taxLabel: UILabel!
    var taxValueLabel: UILabel!
    var totalLabel: UILabel!
    var totalValueLabel: UILabel!
    var checkoutButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        subTotalLabel =  UILabel()
        subTotalLabel.text = "Subtotal"
        self.addSubview(subTotalLabel)
        
        subTotalValueLabel = UILabel()
        subTotalValueLabel.text = "316.62 CHF"
        self.addSubview(subTotalValueLabel)
        
        shippingLabel = UILabel()
        shippingLabel.text = "Shipping"
        self.addSubview(shippingLabel)
        
        shippingValueLabel = UILabel()
        shippingValueLabel.text = "15.00 CHF"
        self.addSubview(shippingValueLabel)
        
        taxLabel = UILabel()
        taxLabel.text = "Tax"
        self.addSubview(taxLabel)
        
        taxValueLabel = UILabel()
        taxValueLabel.text = "24.38"
        self.addSubview(taxValueLabel)
        
        totalLabel = UILabel()
        totalLabel.text = "TOTAL"
        totalLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        self.addSubview(totalLabel)
        
        totalValueLabel = UILabel()
        totalValueLabel.text = "356.00 CHF"
        totalValueLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        self.addSubview(totalValueLabel)
        
        checkoutButton = UIButton()
        checkoutButton.setTitle("CHECKOUT", for: .normal)
        checkoutButton.configuration = .filled()
        checkoutButton.configuration?.cornerStyle = .large
        checkoutButton.configuration?.baseBackgroundColor = .black
        checkoutButton.configuration?.baseForegroundColor = .white
        self.addSubview(checkoutButton)
    }
    
    func setupConstraints() {
        subTotalLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
        }
        
        subTotalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        
        shippingLabel.snp.makeConstraints { make in
            make.top.equalTo(subTotalLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
        }
        
        shippingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(subTotalValueLabel.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        
        
        taxLabel.snp.makeConstraints { make in
            make.top.equalTo(shippingLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
        }
        
        taxValueLabel.snp.makeConstraints { make in
            make.top.equalTo(shippingValueLabel.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-10)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(taxLabel.snp.bottom).offset(20)
            make.left.equalTo(self).offset(10)
        }
        
        totalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(taxValueLabel.snp.bottom).offset(20)
            make.right.equalTo(self).offset(-10)
        }
        
        checkoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-30)
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
        }
    }
}
