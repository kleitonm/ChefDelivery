//
//  SearchStoreView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 02/11/25.
//

import SwiftUI

struct SearchStoreView: View {
    
    let service: SearchService
    @State var storesType: [StoreType] = []
    @State var searchText: String = ""
    
    // MARK: - Views
    var searchTextView: some View {
        HStack {
            TextField("Pesquisar em Chef Delivery", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button {
                searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .padding(.top, 8)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    searchTextView
                        .listRowSeparator(.hidden)
                    
                    ForEach(storesType, id: \.id) { store in
                        Text(store.name)
                            .font(.custom("Futura", size: 16))
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                }
                .padding(.top, 15)
                .listStyle(PlainListStyle())
                .scrollIndicators(.hidden)
                
                Spacer()
            }
        }
        .onAppear() {
            fetchData()
        }
    }
    // MARK: - Class methods
    
    func fetchData() {
        Task {
            do {
                let result = try await service.fetchData()
                switch result {
                case .success(let stores):
                    self.storesType = stores
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
