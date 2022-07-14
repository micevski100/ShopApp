//
//  DescriptionTableViewCell.swift
//  ShopApp
//
//  Created by Aleksandar Micevski on 20.1.22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    var descriptionLabel: UILabel!
    var descriptionValueLabel: UILabel!
    var sizeLabel: UILabel!
    var sizeButton: UIButton!
    var sizeTextField: UITextField!
    var sizePickerView: UIPickerView!
    var downStrikePickerImage: UIImageView!
    var addToCartButton: UIButton!
    let pickerData = ["1", "2", "3", "4"]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        descriptionLabel = UILabel()
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: descriptionLabel.font.fontName, size: 25)
        descriptionLabel.tintColor = .black
        self.contentView.addSubview(descriptionLabel)
        
        descriptionValueLabel = UILabel()
        descriptionValueLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        descriptionValueLabel.numberOfLines = 0
        self.contentView.addSubview(descriptionValueLabel)
        
        sizeLabel = UILabel()
        sizeLabel.text = "Size"
        self.contentView.addSubview(sizeLabel)
        
        sizeButton = UIButton(type: .system)
        sizeButton.addTarget(self, action: #selector(sizeButtonAction), for: .touchUpInside)
        sizeButton.setTitle("4", for: .normal)
        sizeButton.configuration = .filled()
        sizeButton.configuration?.baseBackgroundColor = .systemGreen
        self.contentView.addSubview(sizeButton)
        
        sizePickerView = UIPickerView()
        sizePickerView.delegate = self
        sizePickerView.dataSource = self
        
        
        sizeTextField = UITextField()
        sizeTextField.isHidden = false
        sizeTextField.inputView = sizePickerView
        self.contentView.addSubview(sizeTextField)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerViewDoneButtonTapped))
        toolBar.setItems([doneButton], animated: false)
        
        sizeTextField.inputAccessoryView = toolBar
        
        downStrikePickerImage = UIImageView()
        downStrikePickerImage.image = UIImage(systemName: "chevron.down")
        self.contentView.addSubview(downStrikePickerImage)
        
        addToCartButton = UIButton(type: .system)
        addToCartButton.tintColor = .white
        addToCartButton.configuration = .filled()
        addToCartButton.configuration?.baseBackgroundColor = .black
        addToCartButton.configuration?.title = "CHF 100.00"
        addToCartButton.configuration?.image = UIImage(systemName: "cart.fill")
        addToCartButton.configuration?.cornerStyle = .large
        addToCartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        self.contentView.addSubview(addToCartButton)
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
        }
        
        descriptionValueLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionValueLabel.snp.bottom).offset(20)
            make.left.equalTo(self.contentView).offset(10)
        }
        
        sizeButton.snp.makeConstraints { make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(10)
            
        }
        
        downStrikePickerImage.snp.makeConstraints { make in
            make.top.equalTo(sizeButton.snp.top).offset(5)
            make.left.equalTo(sizeButton.snp.right).offset(10)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.top.equalTo(downStrikePickerImage.snp.bottom).offset(30)
            make.left.equalTo(self.contentView).offset(20)
            make.right.equalTo(self.contentView).offset(-20)
            make.bottom.equalTo(contentView)
        }
    }
    
    @objc func sizeButtonAction() {
        sizeTextField.becomeFirstResponder()
    }
}

extension DescriptionTableViewCell:  UIPickerViewDelegate, UIPickerViewDataSource {
    @objc func pickerViewDoneButtonTapped() {
        sizeTextField.resignFirstResponder()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeButton.setTitle(pickerData[row], for: .normal)
    }
}
