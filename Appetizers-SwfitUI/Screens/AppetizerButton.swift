//
//  AppetizerButton.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import SwiftUI

struct AppetizerButton: View {
    let label: String
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        Text(label)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(Color(uiColor: colorScheme == .dark ? .black : .white)).background(Colors.brandPrimary).cornerRadius(10)
    }
}

struct AppetizerButton_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerButton(label: "$8.95 - Place order")
    }
}
