//
//  ImageCollectionViewCell.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 20.1.22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        imageView = UIImageView()
        self.contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    func setupCell(imgURL: String) {
        let url = URL(string: imgURL)
        imageView.kf.setImage(with: url)
    }
}
