//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 27/08/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(alignment: .leading) {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(store.name)
                    .bold()
                
                Spacer()
                
                Image(store.logoImage)
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                ForEach(1...store.stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(store.products) { products in
                
                Button {
                    selectedProduct = products
                } label: {
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
                .sheet(item: $selectedProduct) { products in
                    ProductDetailView(product: products)
                }
            }
        }
    }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "cart")
                        
                        Text("Lojas")
                    }
                    .foregroundColor(Color("ColorRed"))
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
