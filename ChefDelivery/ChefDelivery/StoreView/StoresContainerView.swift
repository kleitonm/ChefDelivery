//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 26/08/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    NavigationLink {
                        StoreDetailView(store: mock) 
                    } label: {
                        StoreItemView(store: mock)
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
        .previewLayout(.sizeThatFits)
    }
}
