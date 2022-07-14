//
//  ChatViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 3.2.22.
//

import UIKit

class ChatViewController: UIViewController  {
    
    var username: String!
    var tableView: UITableView!
    var headerView: ChatHeaderView!
    var footerView: ChatFooterView!
    var messages = [String]()
    var conversation = [["Hello World", true, true],
                        ["Hello Back", false, true],
                        ["How is it going?", true, true],
                        ["Its going good. How about you?", false, true],
                        ["Its going good.", true, true],
                        ["Life is goood", true, true],
                        ["Glad to hear that. How's the family doing?", false, true],
                        ["They are doing good, how about yours?", true, true],
                        ["They are doing good as well.", false, true]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         
             // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
           NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        headerView = ChatHeaderView()
        headerView.setupChatHeader(username: username)
        headerView.delegate = self
        self.view.addSubview(headerView)
        
        footerView = ChatFooterView()
        footerView.delegate = self
        self.view.addSubview(footerView)
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(RecieverTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "cell3")
        tableView.separatorStyle = .none
        DispatchQueue.main.async {
                    let indexPath = IndexPath(row: self.conversation.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
                }
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(self.view.frame.size.height / 12)
            make.width.equalTo(self.view.frame.size.width)
            make.left.right.equalTo(self.view)
        }
        
        footerView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(self.view.frame.size.height / 10)
            make.width.equalTo(self.view.frame.size.width)
            make.left.right.equalTo(self.view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(footerView.snp.top)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
      
        // move the root view up by the distance of keyboard height
//        self.view.frame.origin.y = 0 - keyboardSize.height
        footerView.snp.remakeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0 - keyboardSize.height)
            make.height.equalTo(self.view.frame.size.height / 10)
            make.width.equalTo(self.view.frame.size.width)
            make.left.right.equalTo(self.view)
        }
        
        DispatchQueue.main.async {
                    let indexPath = IndexPath(row: self.conversation.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
        // move back the root view origin to zero
        self.view.frame.origin.y = 0
        footerView.snp.remakeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(self.view.frame.size.height / 10)
            make.width.equalTo(self.view.frame.size.width)
            make.left.right.equalTo(self.view)
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let isMessage = conversation[indexPath.row][2] as! Bool
        let sender = conversation[indexPath.row][1] as! Bool
        
        if sender && isMessage {
            let message = conversation[indexPath.row][0] as! String
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ChatTableViewCell
            cell.setupCell(message: message, time: Date())
            return cell
        } else if !sender && isMessage {
            let message = conversation[indexPath.row][0] as! String
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! RecieverTableViewCell

            cell.setupCell(message: message, time: Date())
            return cell
        } else {
            let message = conversation[indexPath.row][0] as! UIImage
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! ImageTableViewCell
            cell.setupCell(image: message)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if conversation[indexPath.row][2] as! Bool == true {
            return UITableView.automaticDimension
        } else {
            return self.view.frame.size.height / 2
        }
    }
    
    
}


extension ChatViewController: ChatHeaderViewDelegate {
    func backButtonTapped() {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
}


extension ChatViewController: ChatFooterViewDelegate {
    func sendPhoto() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    func sendMessage(message: String) {
        conversation.append([message, true, true])
        tableView.reloadData()
        DispatchQueue.main.async {
                    let indexPath = IndexPath(row: self.conversation.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension ChatViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            conversation.append([image, true, false])
            tableView.reloadData()
            DispatchQueue.main.async {
                        let indexPath = IndexPath(row: self.conversation.count-1, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
                    }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
