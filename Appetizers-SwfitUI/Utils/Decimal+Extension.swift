//
//  Decimal+Extension.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 13/09/23.
//

import Foundation

extension Decimal {
    func formattedPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSDecimalNumber(decimal: self)) ?? ""
    }
}
