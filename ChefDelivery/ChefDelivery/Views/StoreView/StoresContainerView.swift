//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 26/08/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    var stores: [StoreType]
    @State private var ratingFilter = 0
    @State private var minDistanceFilter: Double = 0
    @State private var maxDistanceFilter: Double = 100
    
    var filteredStores: [StoreType] {
            return stores.filter { store in
                store.stars >= ratingFilter
            }
        }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }

                    Divider()
                    
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estrelas ou mais")
                            } else {
                                Text("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                
                Menu("Distância") {
                    
                    Button {
                        minDistanceFilter = 0
                        maxDistanceFilter = 100
                    } label: {
                        Text("Limpar filtro")
                    }

                    Divider()
                    
                    ForEach(Array(stride(from: 0, through: 20, by: 5)), id: \.self) { distance in
                        Button {
                            minDistanceFilter = Double(distance)
                            maxDistanceFilter = Double(distance + 5)
                        } label: {
                            Text("De \(distance) até \(distance) km")
                        }

                        
                        
                    }
                }
                .foregroundColor(.black)
            }
            
            VStack(alignment: .leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .font(.title2)
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .foregroundColor(.black)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView(stores: storesMock)
        .previewLayout(.sizeThatFits)
    }
}
