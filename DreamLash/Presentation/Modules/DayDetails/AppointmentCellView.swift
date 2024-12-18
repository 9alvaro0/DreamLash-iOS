//
//  AppointmentCellView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct AppointmentCellView: View {
    let processed: ProcessedAppointment
    let date: Date
    let hourHeight: CGFloat
    
    var body: some View {
        let yOffset = calculateYOffset()
        let height = calculateHeight()
        let (columnWidth, xOffset) = calculateColumnMetrics()
        
        VStack(alignment: .leading, spacing: 4) {
            Text(processed.appointment.startTime.formatted(.dateTime.hour().minute()))
                .font(.caption2)
                .foregroundColor(.brown.opacity(0.8))
            Text("Appointment")
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.brown)
        }
        .frame(width: columnWidth - 8, height: height)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.brown.opacity(0.15))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.brown.opacity(0.3), lineWidth: 1)
        )
        .offset(x: xOffset, y: yOffset)
        .onTapGesture {
            navigateToDetails()
        }
    }
    
    private func calculateYOffset() -> CGFloat {
        let calendar = Calendar.current
        let businessDayStart = calendar.startOfBusinessDay(for: date)
        let startMinutes = calendar.dateComponents([.hour, .minute], from: businessDayStart, to: processed.appointment.startTime)
        let totalStartMinutes = Double(startMinutes.hour ?? 0) * 60.0 + Double(startMinutes.minute ?? 0)
        return (totalStartMinutes / 60.0) * hourHeight + 30
    }
    
    private func calculateHeight() -> CGFloat {
        let durationMinutes = Double(processed.appointment.duration) / 60.0
        return (durationMinutes / 60.0) * hourHeight
    }
    
    private func calculateColumnMetrics() -> (columnWidth: CGFloat, xOffset: CGFloat) {
        let totalHorizontalPadding: CGFloat = 16
        let sidePadding: CGFloat = 18
        let availableWidth = UIScreen.main.bounds.width - 50 - sidePadding
        let columnWidth = (availableWidth - totalHorizontalPadding) / CGFloat(processed.totalColumns)
        let xOffset = 59 + CGFloat(processed.columnIndex) * columnWidth
        return (columnWidth, xOffset)
    }
}
