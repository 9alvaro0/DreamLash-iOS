//
//  AppointmentDetailView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct AppointmentDetailView: View {
    let appointment: Appointment
    
    @Environment(\.dismiss) var dismiss
    @State private var showCancelAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Información de la cita
            HStack {
                Text("Tratamiento:")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text(appointment.treatmentName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Cliente:")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text(appointment.clientName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Horario:")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text(appointment.timeRangeString)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Duración:")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Text("\(appointment.durationInMinutes) min")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if let notes = appointment.notes, !notes.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Notas:")
                        .font(.subheadline)
                        .bold()
                    Text(notes)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Button(role: .destructive) {
                    showCancelAlert.toggle()
                } label: {
                    Text("Cancelar Cita")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .foregroundColor(.red)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Detalles de la Cita")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cerrar") {
                    dismiss()
                }
            }
        }
        .alert("¿Estás seguro de que deseas cancelar esta cita?", isPresented: $showCancelAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Confirmar", role: .destructive) {
                // Acción para cancelar la cita
                print("Cita cancelada")
            }
        }
        
    }
}


struct PostponeAppointmentView: View {
    @State var appointment: Appointment
    @State private var newDate = Date()
    
    var body: some View {
        VStack(spacing: 16) {
            DatePicker("Nueva Fecha y Hora", selection: $newDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Spacer()
            
            Button {
                // Acción para guardar el cambio
                print("Cita pospuesta a \(newDate)")
            } label: {
                Text("Confirmar Nueva Fecha")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Posponer Cita")
    }
}
