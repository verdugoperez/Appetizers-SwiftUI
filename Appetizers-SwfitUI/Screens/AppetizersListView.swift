//
//  AppetizersListView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView {
            Text("Home").navigationTitle("🍟 Appetizers")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
