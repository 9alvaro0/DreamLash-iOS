//
//  AppointmentCell.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct AppointmentCell: View {
    let appointment: Appointment
    @State private var showDetail = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(appointment.treatmentName)
                    .font(.headline)
                    .foregroundColor(.brown)
                Spacer()
                statusIcon
            }
            
            Text(appointment.clientName)
                .font(.subheadline)
                .foregroundColor(.brown.opacity(0.8))
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(.brown.opacity(0.6))
                Text(appointment.timeRangeString)
                    .font(.caption)
                    .foregroundColor(.brown.opacity(0.8))
            }
            
            HStack {
                Image(systemName: "timer")
                    .foregroundColor(.brown.opacity(0.6))
                Text("\(appointment.durationInMinutes) min")
                    .font(.caption)
                    .foregroundColor(.brown.opacity(0.8))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.brown.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.brown.opacity(0.2), lineWidth: 1)
        )
        .onTapGesture {
            showDetail.toggle()
        }
        .sheet(isPresented: $showDetail) {
            AppointmentDetailView(appointment: appointment)
        }
    }
    
    private var statusIcon: some View {
        Group {
            if appointment.isConfirmed {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.orange)
            }
        }
    }
}
