//
//  ProfileHeaderUIView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 26.1.22.
//

import UIKit

protocol ProfilePictureChangeDelegate {
    func selectPhoto()
}

class ProfileHeaderUIView: UIView {
    
    var delegate: ProfilePictureChangeDelegate?
    var profileImageView: UIImageView!
    var itemsLabel: UILabel!
    var itemsValueLabel: UILabel!
    var followingLabel: UILabel!
    var followingValueLabel: UILabel!
    var followersLabel: UILabel!
    var followersValueLabel: UILabel!
    var personNameLabel: UILabel!
    var addPhotoButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        profileImageView = UIImageView()
        profileImageView.image = UIColor.black.image(CGSize(width: self.frame.width / 2, height: self.frame.width / 2))
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.image!.size.width / 6
        profileImageView.clipsToBounds = true
        self.addSubview(profileImageView)
        
        addPhotoButton = UIButton()
        addPhotoButton.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        addPhotoButton.backgroundColor = .blue
        addPhotoButton.tintColor = .white
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.cornerRadius = addPhotoButton.imageView!.image!.size.width / 2
        addPhotoButton.addTarget(self, action: #selector(addPhotoButtonAction), for: .touchUpInside)
        self.addSubview(addPhotoButton)
        
        personNameLabel = UILabel()
        personNameLabel.text = "Aleksandar Micevski"
        self.addSubview(personNameLabel)
        
        itemsLabel = UILabel()
        itemsLabel.text = "Items"
        self.addSubview(itemsLabel)
        
        itemsValueLabel = UILabel()
        itemsValueLabel.text = "0"
        self.addSubview(itemsValueLabel)
        
        followingLabel = UILabel()
        followingLabel.text = "Following"
        self.addSubview(followingLabel)
        
        followingValueLabel = UILabel()
        followingValueLabel.text = "0"
        self.addSubview(followingValueLabel)
        
        followersLabel = UILabel()
        followersLabel.text = "Followers"
        self.addSubview(followersLabel)
        
        followersValueLabel = UILabel()
        followersValueLabel.text = "0"
        self.addSubview(followersValueLabel)
    }
    
    func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self).offset(10)
            make.width.height.equalTo(self.snp.height).dividedBy(2)
        }
        
        addPhotoButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.profileImageView.snp.bottom)
            make.right.equalTo(profileImageView.snp.right)
        }
        
        personNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self).offset(10)
        }
        
        itemsLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(20)
            make.left.equalTo(profileImageView.snp.right).offset(20)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(20)
            make.left.equalTo(itemsLabel.snp.right).offset(10)
        }
        
        followersLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top).offset(20)
            make.left.equalTo(followingLabel.snp.right).offset(10)
        }
        
        itemsValueLabel.snp.makeConstraints { make in
            make.top.equalTo(itemsLabel.snp.bottom).offset(10)
            make.centerX.equalTo(itemsLabel.snp.centerX)
        }
        
        followingValueLabel.snp.makeConstraints { make in
            make.top.equalTo(followingLabel.snp.bottom).offset(10)
            make.centerX.equalTo(followingLabel.snp.centerX)
        }
        
        followersValueLabel.snp.makeConstraints { make in
            make.top.equalTo(followersLabel.snp.bottom).offset(10)
            make.centerX.equalTo(followersLabel.snp.centerX)
        }
    }
    
    @objc func addPhotoButtonAction() {
        delegate?.selectPhoto()
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
