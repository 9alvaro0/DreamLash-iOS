//
//  AppointmentProcessor.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct AppointmentProcessor {
    let appointments: [Appointment]
    let date: Date
    
    func appointmentsForDay() -> [Appointment] {
        let calendar = Calendar.current
        return appointments.filter {
            calendar.isDate($0.startTime, inSameDayAs: date)
        }
    }
    
    func resolveOverlaps() -> [ProcessedAppointment] {
        let appointmentsForDay = appointmentsForDay()
        var processedAppointments: [ProcessedAppointment] = []
        
        for appointment in appointmentsForDay {
            var columnIndex = 0
            let overlappingAppointments = appointmentsForDay.filter {
                // Verifica si las citas se solapan
                ($0.startTime < appointment.endTime &&
                 appointment.startTime < $0.endTime)
            }
            let totalColumns = overlappingAppointments.count
            
            // Asignar índice de columna basado en los ya procesados
            for processed in processedAppointments {
                if overlappingAppointments.contains(where: { $0.id == processed.appointment.id }) {
                    columnIndex += 1
                }
            }
            
            let processed = ProcessedAppointment(
                appointment: appointment,
                columnIndex: columnIndex,
                totalColumns: totalColumns
            )
            processedAppointments.append(processed)
        }
        
        return processedAppointments
    }
}
