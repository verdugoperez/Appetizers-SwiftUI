//
//  Appetizer.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import Foundation

struct Appetizer: Identifiable, Decodable, Hashable {
    let id: Int
    let imageURL: String
    let calories: Int
    let name: String
    let protein: Int
    let description: String
    let price: Decimal
    let carbs: Int
}
