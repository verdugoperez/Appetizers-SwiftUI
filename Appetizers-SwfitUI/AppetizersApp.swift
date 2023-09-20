//
//  AppetizersApp.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AppetizersApp: View {
    
    var order = Order()
    
    var body: some View {
        AppetizersTabView().environmentObject(order)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersApp()
    }
}
