//
//  MyAppointmentsView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct MyAppointmentsView: View {
    let appointment: Appointment?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Siguiente Cita")
                .font(.headline)
                .padding(.horizontal)
            
            if let appointment {
                AppointmentCell(appointment: appointment)
                    .padding(.horizontal)
                    .padding(.bottom)
            } else {
                Text("No tienes citas para esta fecha.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
        }
    }
}
