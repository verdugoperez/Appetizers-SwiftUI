//
//  AppetizersListView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersListView: View {
    let appetizers: [Appetizer]
    var body: some View {
        NavigationView {
            List(appetizers) { appetizer in
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 140, height: 110).cornerRadius(10).padding(.trailing, 12)
                        VStack(alignment: .leading) {
                            Text(appetizer.name).font(.system(size: 14, weight: .medium)).padding(.bottom, 2)
                            Text(formattedPrice(price:appetizer.price)).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                    Divider()
                }.listRowSeparator(.hidden)
            }.navigationTitle("🍟 Appetizers")
        }
    }
    
    func formattedPrice(price: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSDecimalNumber(decimal: price)) ?? ""
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let appetizers = [Appetizer]()
        AppetizersListView(appetizers: appetizers)
    }
}
