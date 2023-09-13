//
//  AppetizerDetailView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 13/09/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetizer: Appetizer
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button {
                print("tap")
            } label: {
                Text("\(appetizer.price.formattedPrice()) - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white).background(Colors.brandPrimary).cornerRadius(10)
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button(action: {
            dismiss()
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }), alignment: .topTrailing)
        
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let appetizer = Appetizer(id: 1, imageURL: "", calories: 1000, name: "Taco", protein: 300, description: "lorem ipsum", price: 35.0, carbs: 34)
        AppetizerDetailView(appetizer: appetizer)
    }
}
