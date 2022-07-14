//
//  DataHolder.swift
//  ShopApp3
//
//  Created by Aleksandar Micevski on 28.1.22.
//

import Foundation

struct DataHolder {
    static var products = [
        Product(name: "Product 1",
                imageURLs: [
                    "https://ae01.alicdn.com/kf/H80b30cc3bfe444c7a80282d542085172s/Pants-Solid-Color-Thin-Male-Men-Beam-Feet-Cargo-Pants-for-Daily-Life.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/H99de9e014b3e428aa5d5d4db08d1afe3y/Pants-Solid-Color-Thin-Male-Men-Beam-Feet-Cargo-Pants-for-Daily-Life.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/Hfe5f88efacfd413f9ed70901c25e8a91M/Pants-Solid-Color-Thin-Male-Men-Beam-Feet-Cargo-Pants-for-Daily-Life.jpg_50x50.jpg_.webp",
                ],
                description: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
        
        Product(name: "Product 2",
                imageURLs: [
                    "https://ae01.alicdn.com/kf/HTB11J2TbwaH3KVjSZFpq6zhKpXa6/2pcs-Sexy-Women-Summer-Swimwear-Bikini-Set-Bra-Tie-Side-G-String-Thong-Beach-Triangle-Suit.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/HTB1H7PTbECF3KVjSZJnq6znHFXav/2pcs-Sexy-Women-Summer-Swimwear-Bikini-Set-Bra-Tie-Side-G-String-Thong-Beach-Triangle-Suit.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/HTB1RPL0bBGw3KVjSZFwq6zQ2FXau/2pcs-Sexy-Women-Summer-Swimwear-Bikini-Set-Bra-Tie-Side-G-String-Thong-Beach-Triangle-Suit.jpg_50x50.jpg_.webp"
                ],
                description: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
        
        Product(name: "Product 3",
                imageURLs: [
                    "https://ae01.alicdn.com/kf/H7652737ac2c2405ba0297d0043502035G/waterproof-screen-protector-for-apple-watch-7-6-SE-5-4-3-38MM-40MM-44MM-42MM.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/Hb7998189e1d1451596df870f29ea6b568/waterproof-screen-protector-for-apple-watch-7-6-SE-5-4-3-38MM-40MM-44MM-42MM.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/Hdc996c3c60ec46d5b0e080467db1cc037/waterproof-screen-protector-for-apple-watch-7-6-SE-5-4-3-38MM-40MM-44MM-42MM.jpg_50x50.jpg_.webp"
                ],
                description: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
        
        
        Product(name: "Product 4",
                imageURLs: [
                    "https://ae01.alicdn.com/kf/H37af5805c6504e85a5f89ac5a6dd38eei/NORMOV-Winter-Warm-Pantyhose-Women-Super-Elastic-Black-Slim-Pantyhose-For-Women-Casual-Fashion-Plus-Velvet.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/H55badc5758be4402ac1ad983bb49db20X/NORMOV-Winter-Warm-Pantyhose-Women-Super-Elastic-Black-Slim-Pantyhose-For-Women-Casual-Fashion-Plus-Velvet.jpg_50x50.jpg_.webp",
                    "https://ae01.alicdn.com/kf/H511b02e272324ce2921c6bf8832764c9U/NORMOV-Winter-Warm-Pantyhose-Women-Super-Elastic-Black-Slim-Pantyhose-For-Women-Casual-Fashion-Plus-Velvet.jpg_50x50.jpg_.webp"
                ],
                description: "orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
    ]
    
    static var shops = [
        Shop(name: "LC Waikiki",
             coverImageURL: "https://fastly.4sqi.net/img/general/600x600/1427675_HTjt_a7CODKGPZI0Xy_mCER2xrpa8GZMdQY4EP0yO-I.jpg",
             products: products),
        
        Shop(name: "Pull and Bear",
             coverImageURL: "https://upload.wikimedia.org/wikipedia/commons/2/22/Pull_and_bear_store.jpg",
             products: products),
        
        Shop(name: "Zara",
             coverImageURL: "https://www.strategyzer.com/hubfs/zara-large.jpg",
             products: products)
    ]
}
