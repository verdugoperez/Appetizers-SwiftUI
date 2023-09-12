//
//  AppetizersTabView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersTabView: View {
    
    
    var body: some View {
        TabView {
            AppetizersListView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            AccountView().tabItem {
                Label("Account", systemImage: "person.crop.circle.fill")
            }
            OrderView().tabItem {
                Label("Order", systemImage: "bag.fill")
            }
        }.accentColor(Colors.brandPrimary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}
