//
//  NutritionView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 18/09/23.
//

import SwiftUI

struct NutritionView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView(title: "Carbs", value: 30)
    }
}
