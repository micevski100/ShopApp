//
//  ArticleViewController.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 31.1.22.
//

import UIKit

class ArticleViewController: UIViewController, ArticleHeaderViewDelegate{
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

    var tableView: UITableView!
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        let tableViewHeader = ArticleHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height / 3))
        tableViewHeader.productImageView.kf.setImage(with: URL(string: product.imageURLs[0]))
        tableViewHeader.delegate = self
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        tableView.register(MoreItemsTableViewCell.self, forCellReuseIdentifier: "cell3")
        
        tableView.tableHeaderView = tableViewHeader
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArticleTableViewCell
            cell.setupCell(product: DataHolder.products[indexPath.row])
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            cell.textLabel?.text = "Settings"
            cell.accessoryView = UIImageView(image: UIImage(systemName: "chevron.right"))
//            cell.imageView?.image = UIImage(systemName: "gearshape")
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! MoreItemsTableViewCell
            
            cell.setupCell(product: DataHolder.products[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.height / 3
        } else if indexPath.row == 1 {
            return self.view.frame.size.height / 13
        } else {
            return self.view.frame.size.height / 4
        }

    }
}
