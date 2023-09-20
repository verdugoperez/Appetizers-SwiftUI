//
//  OrderView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            VStack {
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "There are no items in your order.")
                } else {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerView(appetizer: appetizer)
                        }.onDelete(perform: onDeleteOrder)
                    }.listStyle(.plain)
                    Button {
                        
                    } label: {
                       AppetizerButton(label: "$800.00 - Place order")
                    }.padding(.bottom, 16)
                }
               
            }.navigationTitle("📰 Orders")
        }
    }
    
    private func onDeleteOrder(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
