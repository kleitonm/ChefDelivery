//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 27/08/25.
//

import Foundation

struct ProductType: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
    }
}
