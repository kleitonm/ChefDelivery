//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 27/08/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    @EnvironmentObject var store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(alignment: .leading) {
            
            StoreDetailsHeaderView()
            
            StoreDetailProductsView()
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

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView()
            .environmentObject(storesMock[0])
    }
}
