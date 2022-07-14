//
//  NavigationView.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 14.1.22.
//

import UIKit
import SwiftUI
import SnapKit

protocol NavigationViewDelegate {
    func backButtonTapped()
    func cartButtonTapped()
    func messagesButtonTapped()
    func notificationsButtonTapped()
}

class NavigationView: UIView {
    var delegate: NavigationViewDelegate?
    var backButton: UIButton!
    var cartButton: UIButton!
    var messagesButton: UIButton!
    var notificationsButton: UIButton!
    var searchButton: UIButton!
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white
        
        notificationsButton = UIButton()
        notificationsButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        notificationsButton.addTarget(self, action: #selector(notificationsButtonAction), for: .touchUpInside)
        self.addSubview(notificationsButton)
        
        messagesButton = UIButton()
        messagesButton.setImage(UIImage(systemName: "message.fill"), for: .normal)
        messagesButton.addTarget(self, action: #selector(messagesButtonAction), for: .touchUpInside)
        self.addSubview(messagesButton)
        
        cartButton = UIButton()
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        cartButton.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        self.addSubview(cartButton)
        
        title = UILabel()
        configure(title: "Shops", backButton: false)
        self.addSubview(title)
        
        backButton = UIButton()
        backButton.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.addSubview(backButton)
        
        searchButton = UIButton()
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        self.addSubview(searchButton)
        
    }
    
    @objc func cartButtonTapped() {
        self.delegate?.cartButtonTapped()
    }
    
    @objc func backButtonAction() {
        self.delegate?.backButtonTapped()
    }
    
    @objc func messagesButtonAction() {
        self.delegate?.messagesButtonTapped()
    }
    
    @objc func notificationsButtonAction() {
        self.delegate?.notificationsButtonTapped()
    }
    
    func configure(title: String, searchButton: Bool) {
        self.title.text = title
        
        if searchButton {
            cartButton.snp.removeConstraints()
            cartButton.removeFromSuperview()
            
            self.searchButton.snp.makeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.right.equalTo(messagesButton.snp.left).offset(-15)
            }
        }
    }
    
    func configure(title: String, backButton: Bool) {
        self.title.text = title
        
        if backButton {
            notificationsButton.snp.removeConstraints()
            notificationsButton.removeFromSuperview()
            messagesButton.snp.removeConstraints()
            messagesButton.removeFromSuperview()
            
            self.cartButton.snp.remakeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.right.equalTo(self.snp.right).offset(-15)
            }
            self.backButton.snp.makeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.left.equalTo(self).offset(10)
            }
            self.title.snp.remakeConstraints { make in
                make.top.equalTo(self.snp.top)
                make.bottom.equalTo(self.snp.bottom)
                make.left.equalTo(self.backButton.snp.right).offset(10)
            }
        }
    }
    
    func setupConstraints() {
        notificationsButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(self.snp.right).offset(-15)
        }
        
        messagesButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(notificationsButton.snp.left).offset(-15)
        }
        
        cartButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(messagesButton.snp.left).offset(-15)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self).offset(15)
        }
        
    }
}
