//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 27/08/25.
//

import Foundation

class StoreType: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let distance: Double
    let products: [ProductType]
    
    init(id: Int, name: String, logoImage: String, headerImage: String, location: String, stars: Int, distance: Double, products: [ProductType]) {
        self.id = id
        self.name = name
        self.logoImage = logoImage
        self.headerImage = headerImage
        self.location = location
        self.stars = stars
        self.distance = distance
        self.products = products
    }
}
