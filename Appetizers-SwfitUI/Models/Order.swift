//
//  Order.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import Foundation

final class Order: ObservableObject {
    @Published var items = [Appetizer]()
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
}
