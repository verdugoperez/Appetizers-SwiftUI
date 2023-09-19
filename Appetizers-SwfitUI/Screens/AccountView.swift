//
//  AccountView.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 06/09/23.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName: String = String()
    @State private var lastName: String = String()
    @State private var email: String = String()
    @State private var birthDay: Date = .now
    @State private var extraNapkins = false
    @State private var frequentRefils = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                    TextField("email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    DatePicker("Birthday", selection: $birthDay, displayedComponents: .date)
                    Button {
                        
                    } label: {
                        Text("Save changes")
                    }
                } header: {
                    Text("Personal info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefils)
                } header: {
                    Text("Requests")
                }.toggleStyle(SwitchToggleStyle(tint: Colors.brandPrimary))


            }.navigationTitle("😀 Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
