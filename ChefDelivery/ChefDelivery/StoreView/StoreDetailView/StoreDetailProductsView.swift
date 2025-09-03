//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 03/09/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let product: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(product) { product in
                
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(products: product)
                }
                .sheet(item: $selectedProduct) { products in
                    ProductDetailView(product: products)
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(product: storesMock[0].products)
}
