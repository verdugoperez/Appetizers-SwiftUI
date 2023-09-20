//
//  OrderView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.appetizers.isEmpty {
                    EmptyState(imageName: "empty-order", message: "There are no items in your order.")
                } else {
                    List {
                        ForEach(viewModel.appetizers) { appetizer in
                            AppetizerView(appetizer: appetizer)
                        }.onDelete(perform: onDeleteOrder)
                    }.listStyle(.plain)
                    Button {
                        
                    } label: {
                       AppetizerButton(label: "$800.00 - Place order")
                    }.padding(.bottom, 16)
                }
               
            }.navigationTitle("📰 Orders")
        }.onAppear {
            Task {
                await viewModel.getAppetizers()
            }
        }
    }
    
    private func onDeleteOrder(at offsets: IndexSet) {
        viewModel.appetizers.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
