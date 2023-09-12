//
//  AppetizersListView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersListView: View {
    @ObservedObject var viewModel = AppetizersListViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    VStack(alignment: .leading) {
                        HStack {
                            AppetizerRemoteImage(urlString: appetizer.imageURL)
                            .frame(width: 140, height: 110).cornerRadius(10).padding(.trailing, 12)
                            VStack(alignment: .leading) {
                                Text(appetizer.name).font(.system(size: 14, weight: .medium)).padding(.bottom, 2)
                                Text(formattedPrice(price:appetizer.price)).font(.subheadline).foregroundColor(.gray)
                            }
                        }
                        Divider()
                    }.listRowSeparator(.hidden)
                }
            }.onAppear {
                Task {
                    await viewModel.getAppetizers()
                }
            }.alert(Text(viewModel.errorMesage ?? ""), isPresented: $viewModel.showError) {}
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }.navigationTitle("🍟 Appetizers")
    }
    
    func formattedPrice(price: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSDecimalNumber(decimal: price)) ?? ""
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
