//
//  ProcessedAppointment.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct ProcessedAppointment: Identifiable {
    let appointment: Appointment
    let columnIndex: Int
    let totalColumns: Int
    
    var id: UUID {
        appointment.id
    }
}
