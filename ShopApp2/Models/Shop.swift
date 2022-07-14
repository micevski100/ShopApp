//
//  Shop.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 21.1.22.
//

import Foundation

class Shop {
    
    var name: String
    var coverImageURL: String
    var products: [Product]
    
    init(name: String, coverImageURL: String, products: [Product]) {
        self.name = name
        self.coverImageURL = coverImageURL
        self.products = products
    }
}
