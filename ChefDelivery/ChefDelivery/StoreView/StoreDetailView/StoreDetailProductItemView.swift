//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 03/09/25.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    
    let products: ProductType
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 10) {
                Text(products.name)
                    .bold()
                
                Text(products.description)
                    .foregroundColor(.black.opacity(0.5))
                    .multilineTextAlignment(.leading)
                
                Text(products.formattedPrice)
            }
            
            Spacer()
            
            Image(products.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
        }
        .padding()
        .foregroundColor(.black)
    }
}

#Preview {
    StoreDetailProductItemView(products: storesMock[0].products[0])
}
