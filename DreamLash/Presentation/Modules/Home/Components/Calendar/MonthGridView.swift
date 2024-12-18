//
//  MonthGridView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct MonthGridView: View {
    let currentMonth: Date
    @Binding var selectedDate: Date?
    @Binding var isExpanded: Bool
    
    private var daysToDisplay: [Date?] {
        if isExpanded {
            guard let firstDay = currentMonth.daysInMonth().first else { return [] }
            let offset = firstDay.weekdayOffset()
            let prefix: [Date?] = Array(repeating: nil, count: offset)
            return prefix + currentMonth.daysInMonth()
        } else {
            return selectedDate?.daysInWeek().map { Optional($0) } ?? []
        }
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
            ForEach(daysToDisplay.indices, id: \.self) { index in
                if let date = daysToDisplay[index] {
                    DayView(
                        date: date,
                        isSelected: selectedDate != nil && Calendar.current.isDate(date, inSameDayAs: selectedDate!),
                        isFullyBooked: false,
                        onSelect: onSelect
                    )
                } else {
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    private func onSelect(_ selectedDate: Date) {
        if self.selectedDate?.isInSameWeek(as: selectedDate) == true {
            self.selectedDate = selectedDate
        } else {
            withAnimation {
                self.selectedDate = selectedDate
                self.isExpanded = false
            }
        }
    }
}
