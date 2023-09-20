//
//  AppetizersListView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel = AppetizersListViewModel()
    @State var selectedAppetizer: Appetizer?

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerView(appetizer: appetizer).onTapGesture {
                        selectedAppetizer = appetizer
                    }
                }.onAppear {
                    Task {
                        await viewModel.getAppetizers()
                    }
                }.navigationTitle("🍟 Appetizers").fullScreenCover(item: $selectedAppetizer) { item in
                    AppetizerDetailView(appetizer: item)
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
