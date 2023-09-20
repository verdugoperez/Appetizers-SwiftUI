//
//  AccountViewModel.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: (title: String, message: String?, isShowing: Bool) = (title: "", message: nil, isShowing: false)
    
    
    private var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem.title = "Error"
            alertItem.message = "Los campos son necesarios"
            alertItem.isShowing = true
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem.title = "Error"
            alertItem.message = "El email no tiene el formato correcto"
            alertItem.isShowing = true
            return false
        }
        
        alertItem.title = ""
        alertItem.message = nil
        alertItem.isShowing = false
        
        return true
    }
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            userData = try JSONEncoder().encode(user)
            alertItem.title = "Exito!"
            alertItem.message = "Usuario guardado correctamente"
            alertItem.isShowing = true
        } catch {
            self.alertItem.message = "No se pudo guardar el usuario"
            self.alertItem.isShowing = true
        }
        
    }
}
