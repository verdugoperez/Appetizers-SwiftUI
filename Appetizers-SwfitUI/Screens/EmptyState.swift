//
//  EmptyState.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        VStack {
            Image(imageName).resizable().scaledToFit().frame(height: 150)
            Text(message)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", message: "Default messsage")
    }
}
