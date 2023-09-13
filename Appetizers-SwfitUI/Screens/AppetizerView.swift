//
//  AppetizerView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 12/09/23.
//

import SwiftUI

struct AppetizerView: View {
    var appetizer: Appetizer
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 140, height: 110).cornerRadius(10).padding(.trailing, 12)
                VStack(alignment: .leading) {
                    Text(appetizer.name).font(.system(size: 14, weight: .medium)).padding(.bottom, 2)
                    Text(appetizer.price.formattedPrice()).font(.subheadline).foregroundColor(.gray)
                }
            }
            Divider()
        }.listRowSeparator(.hidden)
    }
}

struct AppetizerView_Previews: PreviewProvider {
    static var previews: some View {
        let appetizer = Appetizer(id: 1, imageURL: "", calories: 1000, name: "Taco", protein: 300, description: "lorem ipsum", price: 35.0, carbs: 34)
        AppetizerView(appetizer: appetizer)
    }
}
