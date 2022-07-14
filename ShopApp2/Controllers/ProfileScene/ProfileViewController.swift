//
//  ProfileViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 25.1.22.
//

import UIKit

class SectionOption {
    let imageName: String
    let text: String
    
    init(imageName: String, text: String) {
        self.imageName = imageName
        self.text = text
    }
}

class Section {
    
    let title: String
    let options: [SectionOption]
    var isOpened: Bool = false
    
    init(title: String, options: [SectionOption], isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class ProfileViewController: UIViewController {
    
    
    var tableViewHeader: ProfileHeaderUIView!
    var navbar: NavigationView!
    var tableView: UITableView!
    var sections = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [
            Section(title: "Personal Information", options: [
                SectionOption(imageName: "questionmark", text: "FAQ"),
                SectionOption(imageName: "bag.fill", text: "orders"),
                SectionOption(imageName: "shippingbox", text: "Delivery Information"),
                SectionOption(imageName: "person.fill", text: "Edit Profile")
            ]),
            Section(title: "My shop", options: [
                SectionOption(imageName: "cart", text: "Label21"),
                SectionOption(imageName: "cart", text: "Label22"),
                SectionOption(imageName: "cart", text: "Label23")
            ]),
            Section(title: "Membership", options: [
                SectionOption(imageName: "cart", text: "Label31"),
                SectionOption(imageName: "cart", text: "Label32"),
                SectionOption(imageName: "cart", text: "Label33")
            ]),
            Section(title: "General information", options: [
                SectionOption(imageName: "cart", text: "Label41"),
                SectionOption(imageName: "cart", text: "Label42"),
                SectionOption(imageName: "cart", text: "Label43")
            ]),
            Section(title: "Settings", options: [
                SectionOption(imageName: "cart", text: "Label51"),
                SectionOption(imageName: "cart", text: "Label52"),
                SectionOption(imageName: "cart", text: "Label53")
            ])
        ]

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        navbar = NavigationView()
        navbar.configure(title: "Profile", backButton: false)
        navbar.cartButton.snp.removeConstraints()
        navbar.cartButton.removeFromSuperview()
        self.view.addSubview(navbar)
        
        tableViewHeader = ProfileHeaderUIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 6))
        
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.delegate = self
        tableView.dataSource = self
        tableViewHeader.delegate = self
        tableView.tableHeaderView = tableViewHeader
        
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        navbar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalTo(self.view)
            make.height.equalTo(self.view).dividedBy(12)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navbar.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return section.options.count + 1
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = sections[indexPath.section].title
            let red = 250/255.0
            let green = 247/255.0
            let blue = 242/255.0
            cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            cell.imageView?.image = UIImage(systemName: "chevron.down")
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! ProfileTableViewCell
            cell.setupCell(imageName: sections[indexPath.section].options[indexPath.row-1].imageName, cellText: sections[indexPath.section].options[indexPath.row-1].text)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 { 
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else if sections[indexPath.section].isOpened && indexPath.row == 3 {
            let vc = DeliveryInformationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sections[indexPath.section].isOpened && indexPath.row == 1  {
            let vc = FAQViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sections[indexPath.section].isOpened && indexPath.row == 2 {
            let vc = OrdersViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if sections[indexPath.section].isOpened && indexPath.row == 4 {
            let vc = EditProfileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ProfileViewController: ProfilePictureChangeDelegate {
    func selectPhoto() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            tableViewHeader.profileImageView.image = image
            tableView.reloadData()
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
