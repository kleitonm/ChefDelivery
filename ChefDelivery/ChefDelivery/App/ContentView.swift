//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 21/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    OrderTypeGridView()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
