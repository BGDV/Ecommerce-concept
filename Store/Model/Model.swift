//
//  Model.swift
//  Store
//
//  Created by BGDV on 02.12.2022.
//

import Foundation

struct DataFromAPI: Codable, Identifiable {
    var id: Int?
    var home_store: [HomeStore]
    var best_seller: [BestSeller]
}

struct HomeStore: Codable, Identifiable {
    var id: Int
    var is_new: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var is_buy: Bool
}

struct BestSeller: Codable, Identifiable, Hashable {
    var id: Int
    var is_favorites: Bool
    var title: String
    var price_without_discount: Int
    var discount_price: Int
    var picture: String
}

struct ProductDetailModel: Codable, Identifiable, Hashable {
    var count: Int?
    var CPU: String
    var camera: String
    var capacity: [String]
    var color: [String]
    var id: String
    var images: [String]
    var isFavorites: Bool
    var price: Double
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
}

struct ImagesModel: Hashable {
    var id: Int
    var path: String
    var is_new: Bool?
    var title: String?
    var subtitle: String?
    var picture: String?
    var is_buy: Bool?
}

struct ProductToMyCart: Codable, Identifiable, Hashable {
    var amount: Int
    var count: Int?
    var CPU: String
    var camera: String
    var capacity: String
    var color: String
    var id: String
    var images: String
    var isFavorites: Bool
    var price: Double
    var rating: Double
    var sd: String
    var ssd: String
    var title: String
}
