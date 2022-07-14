//
//  ChatFooterView.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 3.2.22.
//

import UIKit

protocol ChatFooterViewDelegate {
    func sendMessage(message: String)
    func sendPhoto()
}

class ChatFooterView: UIView {
    var delegate: ChatFooterViewDelegate?
    var sendPhotoButton: UIButton!
    var senderTextField: UITextField!
    var sendButton: UIButton!
    

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
        
        senderTextField = UITextField()
        senderTextField.borderStyle = .roundedRect
        senderTextField.placeholder = "Message"
        senderTextField.backgroundColor = .systemGray6
        self.addSubview(senderTextField)
        
        sendButton = UIButton()
        sendButton.configuration = .plain()
        sendButton.setTitle("Send", for: .normal)
        sendButton.tintColor = .black
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
        self.addSubview(sendButton)
        
        sendPhotoButton = UIButton()
        sendPhotoButton.setImage(UIImage(systemName: "photo.on.rectangle.angled"), for: .normal)
        sendPhotoButton.addTarget(self, action: #selector(sendPhotoAction), for: .touchUpInside)
        self.addSubview(sendPhotoButton)
    }
    
    func setupConstraints() {
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(self).dividedBy(5)
        }
        
        sendPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(10)
            make.width.equalTo(self).dividedBy(5)
        }
        
        senderTextField.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(sendPhotoButton.snp.right).offset(10)
            make.right.equalTo(sendButton.snp.left).offset(-10)
        }
        
    }
    
    @objc func sendButtonAction() {
        if senderTextField.text != "" {
            delegate?.sendMessage(message: senderTextField.text ?? "")
            senderTextField.text = ""
        }
    }
    
    @objc func sendPhotoAction() {
        delegate?.sendPhoto()
    }

}

