//
//  DayDetailsView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct DayDetailsView: View {
    let date: Date
    let appointments: [Appointment] = Appointment.mocks
    let hourHeight: CGFloat = 60.0
    
    @Environment(HomeRouter.self) var router
    @State private var isDragging: Bool = false
    @GestureState private var dragOffset: CGSize = .zero
    
    private var processedAppointments: [ProcessedAppointment] {
        AppointmentProcessor(appointments: appointments, date: date).resolveOverlaps()
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .topLeading) {
                hourlyGrid
                appointmentsView
            }
            .frame(height: hourHeight * 12)
        }
        .scrollDisabled(isDragging)
    }
    
    private var hourlyGrid: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(9..<21) { hour in
                VStack {
                    HStack(spacing: 0) {
                        Text(String(format: "%02d:00", hour))
                            .font(.caption)
                            .foregroundColor(.brown.opacity(0.6))
                            .frame(width: 50, alignment: .trailing)
                            .padding(.trailing, 8)
                        
                        VStack {
                            Divider()
                                .foregroundStyle(Color.brown.opacity(0.1))
                        }
                    }
                    .frame(height: hourHeight)
                    .contentShape(.rect)
                    .onLongPressGesture {
                        handleTimeSelection(at: hour)
                    }
                }
            }
        }
    }
    
    private var appointmentsView: some View {
        ForEach(processedAppointments) { processed in
            AppointmentCellView(
                processed: processed,
                date: date,
                hourHeight: hourHeight
            )
        }
    }
    
#warning("espabila")
    // TODO: DARLE UNA VUELTA A COMO ELIGE EL USUARIO LA CITA (primero servicio, luego hora en base a las horas que hay disponibles)
    
    private func handleTimeSelection(at hour: Int) {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        let selectedTime = calendar.date(bySettingHour: hour, minute: 0, second: 0, of: date) ?? date
        
        let (availableStart, availableEnd) = calculateAvailableRange(at: selectedTime)
        let timeInterval = DateInterval(start: availableStart, end: availableEnd)
        print("Selected Time:", selectedTime)
        print("Available Range:", timeInterval)
        router.navigateTo(route: .createAppointment(timeInterval))
    }

    private func calculateAvailableRange(at selectedTime: Date) -> (Date, Date) {
        let sortedAppointments = appointments.sorted { $0.startTime < $1.startTime }
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!

        var availableStart = selectedTime
        var availableEnd = calendar.date(bySettingHour: 21, minute: 0, second: 0, of: date)!

        for appointment in sortedAppointments {
            if appointment.endTime <= selectedTime {
                availableStart = max(availableStart, appointment.endTime)
            }

            if appointment.startTime > selectedTime {
                availableEnd = min(availableEnd, appointment.startTime)
            }
        }

        let openingTime = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: date)!
        availableStart = max(availableStart, openingTime)
        
        return (availableStart, availableEnd)
    }
}

#Preview {
    DayDetailsView(
        date: .now
    )
    .environment(HomeRouter())
}
