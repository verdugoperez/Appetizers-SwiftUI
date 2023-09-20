//
//  User.swift
//  Appetizers-SwfitUI
//
//  Created by Administrador on 20/09/23.
//

import Foundation

struct User: Codable {
   var firstName = String()
   var lastName = String()
   var email = String()
   var birthDay = Date()
   var extraNapkins = false
   var frequentRefils = false
}
