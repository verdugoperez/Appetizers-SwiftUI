//
//  AppetizersTabView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersTabView: View {
    @ObservedObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        TabView {
            AppetizersListView(appetizers: viewModel.appetizers).tabItem {
                Label("Home", systemImage: "house.fill")
            }.onAppear {
                Task {
                    await viewModel.getAppetizers()
                }
            }
            AccountView().tabItem {
                Label("Account", systemImage: "person.crop.circle.fill")
            }
            OrderView().tabItem {
                Label("Order", systemImage: "bag.fill")
            }
        }.accentColor(Colors.brandPrimary).alert(Text(viewModel.errorMesage ?? ""), isPresented: $viewModel.showError) {}
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
