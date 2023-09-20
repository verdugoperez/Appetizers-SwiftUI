//
//  AccountView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                    TextField("Last name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedTextField = .email
                        }
                    TextField("email", text: $viewModel.user.email)
                        .textInputAutocapitalization(.never)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .submitLabel(.continue)
                        .autocorrectionDisabled()
                        .onSubmit {
                            focusedTextField = nil
                        }
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
            }.toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
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
