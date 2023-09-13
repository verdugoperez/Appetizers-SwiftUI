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
                    AppetizerView(appetizer: appetizer)
                }.navigationTitle("🍟 Appetizers")
            }.onAppear {
                Task {
                    await viewModel.getAppetizers()
                }
            }.alert(Text(viewModel.errorMesage ?? ""), isPresented: $viewModel.showError) {}
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
