//
//  Product.swift
//  ShopApp2
//
//  Created by Aleksandar Micevski on 21.1.22.
//

import Foundation

class Product {
    
    var name: String
    var imageURLs: [String]
    var description: String
    
    init(name: String, imageURLs: [String], description: String) {
        self.name = name
        self.imageURLs = imageURLs
        self.description = description
    }
}
