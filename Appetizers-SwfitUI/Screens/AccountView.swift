//
//  AccountView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                    TextField("Last name", text: $viewModel.user.lastName)
                    TextField("email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday", selection: $viewModel.user.birthDay, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                    
                } header: {
                    Text("Personal info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefils)
                } header: {
                    Text("Requests")
                }.toggleStyle(SwitchToggleStyle(tint: Colors.brandPrimary))
            }.navigationTitle("😀 Account").alert(viewModel.alertItem.title, isPresented: $viewModel.alertItem.isShowing) {
                
            } message: {
                Text(viewModel.alertItem.message ?? "")
            }

        }.onAppear {
            viewModel.retrieveUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
