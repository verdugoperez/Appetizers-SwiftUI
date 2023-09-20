//
//  Order.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import Foundation

final class Order: ObservableObject {
    @Published private (set) var  items = [Appetizer]() {
        didSet {
            getTotal()
        }
    }
    
    @Published var totalPrice: Decimal = 0.0
    
    init() {
        getTotal()
    }
    
    private func getTotal() {
        totalPrice = items.reduce(0.0) { partialResult, appetizer in
            return partialResult + appetizer.price
        }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}