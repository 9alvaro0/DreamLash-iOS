//
//  AppointmentMocks.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import Foundation

extension Appointment {
    static let mocks: [Appointment] = [
        Appointment(
            userId: UUID(),
            treatmentId: UUID(),
            treatmentName: "Extensiones de Pestañas",
            clientName: "Laura González",
            startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
            duration: 3600 // 1 hora
        ),
        Appointment(
            userId: UUID(),
            treatmentId: UUID(),
            treatmentName: "Lifting de Pestañas",
            clientName: "Ana Martínez",
            startTime: Calendar.current.date(bySettingHour: 12, minute: 00, second: 0, of: Date())!,
            duration: 5400 // 1 hora y 30 minutos
        ),
        Appointment(
            userId: UUID(),
            treatmentId: UUID(),
            treatmentName: "Retoque de Pestañas",
            clientName: "Carla López",
            startTime: Calendar.current.date(bySettingHour: 14, minute: 0, second: 0, of: Date())!,
            duration: 3600 // 1 hora
        ),
        Appointment(
            userId: UUID(),
            treatmentId: UUID(),
            treatmentName: "Diseño de Cejas",
            clientName: "Elena Sánchez",
            startTime: Calendar.current.date(bySettingHour: 16, minute: 15, second: 0, of: Date())!,
            duration: 2700 // 45 minutos
        ),
        Appointment(
            userId: UUID(),
            treatmentId: UUID(),
            treatmentName: "Extensiones Volumen",
            clientName: "María Fernández",
            startTime: Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!)!,
            duration: 7200 // 2 horas
        )
    ]
}
