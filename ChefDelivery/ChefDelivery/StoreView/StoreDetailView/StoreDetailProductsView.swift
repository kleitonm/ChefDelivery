//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 03/09/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    @EnvironmentObject var store: StoreType
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(store.products) { product in
                
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
    StoreDetailProductsView()
        .environmentObject(storesMock[0])
}
