//
//  RecieverTableViewCell.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 4.2.22.
//

import UIKit

class RecieverTableViewCell: UITableViewCell {

    var timeLabel: UILabel!
    var messageLabel: PaddingLabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        timeLabel = UILabel()
        self.contentView.addSubview(timeLabel)
        
        self.selectionStyle = .none
        
        messageLabel = PaddingLabel(withInsets: 8, 8, 18, 18)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.regular)
        messageLabel.layer.backgroundColor = UIColor.black.withAlphaComponent(0.14).cgColor
        messageLabel.layer.cornerRadius = 24
        self.contentView.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(10)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.lessThanOrEqualTo(self.contentView).multipliedBy(0.7)
        }
    }
    
    func setupCell(message: String, time: Date) {
        self.messageLabel.text = message
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d, hh:mm"
        self.timeLabel.text = dateFormatter.string(from: time)
    }

}
