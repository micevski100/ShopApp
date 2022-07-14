//
//  HeaderView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 3.2.22.
//

import UIKit

protocol ChatHeaderViewDelegate {
    func backButtonTapped()
}

class ChatHeaderView: UIView {
    var delegate: ChatHeaderViewDelegate?
    var backButton: UIButton!
    var profileImageView: UIImageView!
    var usernameLabel: UILabel!

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
        backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.addSubview(backButton)
        
        profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.clipsToBounds = true
        self.addSubview(profileImageView)
        
        usernameLabel = UILabel()
        self.addSubview(usernameLabel)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.width.height.equalTo(40)
            make.left.equalTo(self).offset(10)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(backButton.snp.right)
            make.height.width.equalTo(self.snp.height).multipliedBy(0.7)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(profileImageView.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
        }
    }
    
    func setupChatHeader(username: String) {
        usernameLabel.text = username
    }
    
    @objc func backButtonAction() {
        delegate?.backButtonTapped()
    }
    

}
