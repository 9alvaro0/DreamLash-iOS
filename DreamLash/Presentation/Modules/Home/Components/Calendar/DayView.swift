//
//  DayView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct DayView: View {
    let date: Date
    let isSelected: Bool
    let isFullyBooked: Bool
    var onSelect: (Date) -> Void

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    var body: some View {
        let isToday = Calendar.current.isDateInToday(date)
        
        Button {
            let normalizedDate = normalizeDateToNoon(date)
            onSelect(normalizedDate)
        } label: {
            ZStack {
                // Background for all days
                Circle()
                    .fill(Color.brown.opacity(0.05))
                    .frame(width: 40, height: 40)
                
                // Indicator for today
                if isToday {
                    Circle()
                        .stroke(Color.brown.opacity(0.3), lineWidth: 2)
                        .frame(width: 38, height: 38)
                }
                
                // Background for fully booked days
                if isFullyBooked {
                    Circle()
                        .fill(Color.brown.opacity(0.2))
                        .frame(width: 36, height: 36)
                }
                
                // Selected day indicator
                if isSelected {
                    Circle()
                        .fill(Color.brown.opacity(0.8))
                        .frame(width: 36, height: 36)
                }
                
                
                // Day number
                Text(dateFormatter.string(from: date))
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isSelected ? .white : .brown)
            }
            .frame(width: 44, height: 44)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
            .animation(.easeInOut(duration: 0.2), value: isFullyBooked)
        }
        .buttonStyle(.plain)
        .onAppear {
            print("on appear\(date)")
        }
    }
    
    private func normalizeDateToNoon(_ date: Date) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        
        return calendar.date(bySettingHour: 12, minute: 0, second: 0, of: date) ?? date
    }
}

#Preview {
    VStack(spacing: 15) {
        DayView(date: Date(), isSelected: false, isFullyBooked: false, onSelect: { _ in })
        DayView(date: Date(), isSelected: true, isFullyBooked: false, onSelect: { _ in })
        DayView(date: Date().addingTimeInterval(86400), isSelected: false, isFullyBooked: true, onSelect: { _ in })
    }
}
