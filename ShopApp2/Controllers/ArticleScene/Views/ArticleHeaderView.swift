//
//  ArticleHeaderView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 31.1.22.
//

import UIKit

protocol ArticleHeaderViewDelegate {
    func backButtonTapped()
}

class ArticleHeaderView: UIView {
    
    var delegate: ArticleHeaderViewDelegate?
    var backButton: UIButton!
    var moreButton: UIButton!
    var productImageView: UIImageView!
    var colorVisualEffect: UIVisualEffectView!
    var priceVisualEffect: UIVisualEffectView!
    var sizeVisualEffect: UIVisualEffectView!
    var colorLabel: UILabel!
    var colorValueLabel: UILabel!
    var priceLabel: UILabel!
    var priceValueLabel: UILabel!
    var sizeLabel: UILabel!
    var sizeValueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        productImageView = UIImageView()
        self.addSubview(productImageView)
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterial)
        colorVisualEffect = UIVisualEffectView(effect: blurEffect)
        colorVisualEffect.translatesAutoresizingMaskIntoConstraints = false
        colorVisualEffect.clipsToBounds = true
        colorVisualEffect.layer.cornerRadius = 10
        productImageView.addSubview(colorVisualEffect)
        
        priceVisualEffect = UIVisualEffectView(effect: blurEffect)
        priceVisualEffect.translatesAutoresizingMaskIntoConstraints = false
        priceVisualEffect.clipsToBounds = true
        priceVisualEffect.layer.cornerRadius = 10
        productImageView.addSubview(priceVisualEffect)
        
        sizeVisualEffect = UIVisualEffectView(effect: blurEffect)
        sizeVisualEffect.translatesAutoresizingMaskIntoConstraints = false
        sizeVisualEffect.clipsToBounds = true
        sizeVisualEffect.layer.cornerRadius = 10
        productImageView.addSubview(sizeVisualEffect)
        
        colorLabel = UILabel()
        colorLabel.text = "Color"
        productImageView.addSubview(colorLabel)
        
        colorValueLabel = UILabel()
        colorValueLabel.text = "White"
        productImageView.addSubview(colorValueLabel)
        
        priceLabel = UILabel()
        priceLabel.text = "Price"
        productImageView.addSubview(priceLabel)
        
        priceValueLabel = UILabel()
        priceValueLabel.text = "12.00 CHF"
        productImageView.addSubview(priceValueLabel)
        
        sizeLabel = UILabel()
        sizeLabel.text = "Size"
        productImageView.addSubview(sizeLabel)
        
        sizeValueLabel = UILabel()
        sizeValueLabel.text = "40"
        productImageView.addSubview(sizeValueLabel)
        
        
        backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        moreButton = UIButton(type: .system)
        moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        productImageView.addSubview(moreButton)
        
        self.addSubview(backButton)
    }
    
    @objc func backButtonAction() {
        delegate?.backButtonTapped()
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
        }
        
        productImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        colorVisualEffect.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(25)
            make.width.height.equalTo(self.frame.size.width / 4)
        }
        
        priceVisualEffect.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(colorVisualEffect.snp.right).offset(25)
            make.width.height.equalTo(self.frame.size.width / 4)
        }
        
        sizeVisualEffect.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-20)
            make.left.equalTo(priceVisualEffect.snp.right).offset(25)
            make.width.height.equalTo(self.frame.size.width / 4)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(colorVisualEffect.snp.top).offset(20)
            make.centerX.equalTo(colorVisualEffect.snp.centerX)
        }
        
        colorValueLabel.snp.makeConstraints { make in
            make.top.equalTo(colorLabel.snp.bottom).offset(20)
            make.centerX.equalTo(colorVisualEffect.snp.centerX)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceVisualEffect.snp.top).offset(20)
            make.centerX.equalTo(priceVisualEffect.snp.centerX)
        }
        
        priceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.centerX.equalTo(priceVisualEffect.snp.centerX)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeVisualEffect.snp.top).offset(20)
            make.centerX.equalTo(sizeVisualEffect.snp.centerX)
        }
        
        sizeValueLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(20)
            make.centerX.equalTo(sizeVisualEffect.snp.centerX)
        }
    }
}
