//
//  User.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import Foundation

struct User: Identifiable {
    let id: UUID
    var name: String
    var email: String
    var phone: String
    var appointments: [Appointment]
}
