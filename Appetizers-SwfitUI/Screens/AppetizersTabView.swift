//
//  AppetizersTabView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersTabView: View {
    @State var appetizers = [Appetizer]()
    
    var body: some View {
        TabView {
            AppetizersListView(appetizers: appetizers).tabItem {
                Label("Home", systemImage: "house.fill")
            }.onAppear {
                let requestManager = RequestManager()
                guard let url = URL(string: "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers") else { return }
                
                Task {
                    let data = try await requestManager.makeNetworkRequest(url: url)
                    let requestAppetizer = try requestManager.decodeData(RequestAppetizer.self, from: data)
                    
                    appetizers = requestAppetizer.request
                    
                }
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
