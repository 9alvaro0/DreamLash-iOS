//
//  ConfirmationView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 17/12/24.
//


import SwiftUI

struct ConfirmationView: View {
    let date: Date
    let selectedService: ServiceType?
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            Text("¡Cita confirmada!")
                .font(.title)
                .fontWeight(.bold)
            Text("Tu cita ha sido reservada para el \(date.formatted(date: .abbreviated, time: .shortened)).")
                .multilineTextAlignment(.center)
            if let service = selectedService {
                Text("Servicio: \(service.name)")
            }
        }
        .padding()
    }
}
