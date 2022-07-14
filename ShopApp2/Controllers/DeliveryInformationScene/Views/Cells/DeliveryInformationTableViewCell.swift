//
//  DeliveryInformationTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 9.2.22.
//

import UIKit



class DeliveryInformationTableViewCell: UITableViewCell {
    
    var locationImageView: UIImageView!
    var locationLabel: UILabel!
    var editButton: UIButton!
    var holderView: UIView!
    var helperView: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.selectionStyle = .none
        
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
        
        locationImageView = UIImageView()
        locationImageView.image = UIImage(systemName: "location.fill")
        helperView.addSubview(locationImageView)
        
        locationLabel = UILabel()
        locationLabel.numberOfLines = 0
        locationLabel.lineBreakMode = .byWordWrapping
        helperView.addSubview(locationLabel)
        
        editButton = UIButton()
        editButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        editButton.transform = (imageView?.transform.rotated(by: .pi / 2))!
        helperView.addSubview(editButton)
        
        contentView.addSubview(holderView)
    }
    
    func setupConstraints() {
        holderView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(10)
        }
        
        helperView.snp.makeConstraints { make in
            make.edges.equalTo(holderView)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.left.equalTo(helperView).offset(10)
            make.centerY.equalTo(helperView.snp.centerY)
            make.width.height.equalTo(helperView.snp.height).dividedBy(2)
        }
        
        editButton.snp.makeConstraints { make in
            make.centerY.equalTo(helperView.snp.centerY)
            make.right.equalTo(helperView)
            make.width.height.equalTo(helperView.snp.height)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(helperView).offset(10)
            make.left.equalTo(locationImageView.snp.right).offset(10)
            make.right.equalTo(editButton.snp.left).offset(-10)
        }
    }
    
    func setupCell(location: String) {
        locationLabel.text = location
    }
}
