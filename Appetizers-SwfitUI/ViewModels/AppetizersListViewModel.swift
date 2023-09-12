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
    @Published var isLoading = false
    
    private var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    
    convenience init() {
        self.init(networkManager: NetworkManager())
    }
    
    func getAppetizers() async {
        isLoading = true
        do {
            appetizers = try await networkManager.getAppetizersAsync()
            isLoading = false
        } catch {
            showError = true
            errorMesage = error.localizedDescription
            isLoading = false
        }
    }
}
