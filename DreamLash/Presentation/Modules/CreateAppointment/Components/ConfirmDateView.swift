//
//  ConfirmDateView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 17/12/24.
//

import SwiftUI

struct ConfirmDateView: View {
    let date: Date
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "es_ES")
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "es_ES")
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Confirma la fecha")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.brown)
            
            VStack(alignment: .leading, spacing: 16) {
                dateRow(
                    icon: "calendar",
                    title: "Fecha",
                    value: dateFormatter.string(from: date)
                )
                dateRow(
                    icon: "clock",
                    title: "Hora",
                    value: timeFormatter.string(from: date)
                )
                dateRow(
                    icon: "hourglass",
                    title: "Tiempo Restante",
                    value: formattedTimeUntilAppointment()
                )
            }
            .padding()
            .cornerRadius(12)
        }
    }
    
    private func formattedTimeUntilAppointment() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .hour], from: now, to: date)
        
        if let days = components.day, days > 0 {
            if days == 1 {
                return "La cita es mañana"
            } else if days < 7 {
                return "La cita es en \(days) días"
            } else {
                let weeks = days / 7
                return "La cita es dentro de \(weeks) semana\(weeks > 1 ? "s" : "")"
            }
        } else if let hours = components.hour, hours > 0 {
            return "La cita es en \(hours) hora\(hours > 1 ? "s" : "")"
        } else {
            return "La cita es en breve"
        }
    }
    
    private func dateRow(icon: String, title: String, value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.brown)
                .font(.system(size: 22))
            
            Text(value)
                .font(.headline)
                .foregroundColor(.brown)
        }
    }
}

#Preview {
    ConfirmDateView(date: Calendar.current.date(byAdding: .day, value: 3, to: .now)!)
}
