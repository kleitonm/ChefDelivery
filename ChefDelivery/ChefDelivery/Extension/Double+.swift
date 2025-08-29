//
//  Double+.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 29/08/25.
//

import Foundation

extension Double {
    
    func formatPrice() -> String {
        let formmetString = String(format: "%.2f", self)
        return formmetString.replacingOccurrences(of: ".", with: ",")
    }
}
