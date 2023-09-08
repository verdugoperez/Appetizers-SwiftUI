//
//  AppetizersListViewModel.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 08/09/23.
//

import Foundation
@MainActor
class AppetizersListViewModel: ObservableObject {
    @Published var appetizers = [Appetizer]()
    @Published var errorMesage: String?
    @Published var showError = false
    
    private var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    
    convenience init() {
        self.init(networkManager: NetworkManager())
    }
    
    func getAppetizers() async {
        do {
            appetizers = try await networkManager.getAppetizersAsync()
        } catch {
            showError = true
            errorMesage = error.localizedDescription
        }
    }
}
