//
//  CategoriesNavigationView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 25.1.22.
//

import UIKit

class CategoriesNavigationView: UIView {
    
    var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        self.addSubview(scrollView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func textWidth(text: String, font: UIFont?) -> CGFloat {
       let attributes = font != nil ? [NSAttributedString.Key.font: font] : [:]
       return text.size(withAttributes: attributes as [NSAttributedString.Key : Any]).width
    }
    
    func setupButttons(buttonNames: [String]) {
        var previousButton : UIButton!
        
        for i in 0..<buttonNames.count {
            let button = UIButton(type: .system)
            button.setTitle(buttonNames[i], for: .normal)
            button.tintColor = .black
            scrollView.addSubview(button)
            
            if i == 0 {
                button.snp.makeConstraints { make in
                    make.top.bottom.equalTo(self)
                    make.left.equalTo(scrollView).offset(5)
                    make.width.equalTo(textWidth(text: buttonNames[i], font: UIFont(name: "Times New Roman", size: 14)!) + 20)
                    
                }
            } else {
                button.snp.makeConstraints { make in
                    make.top.bottom.equalTo(self)
                    make.left.equalTo(previousButton.snp.right).offset(5)
                    make.width.equalTo(textWidth(text: buttonNames[i], font: UIFont(name: "Times New Roman", size: 14)!) + 20)
                    
                    if buttonNames.count - 1 == i {
                        make.right.equalTo(scrollView).offset(-5)
                    }
                }
            }
            
         previousButton = button
        }
    }
}
