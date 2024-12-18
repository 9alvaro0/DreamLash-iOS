//
//  CalendarView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date?
    @State private var currentMonth: Date = Date()
    @State private var isExpanded: Bool = true
    
    var body: some View {
        VStack {
            MonthHeaderView(
                currentMonth: $currentMonth,
                isExpanded: $isExpanded,
                selectedDate: $selectedDate
            )
            
            DaysInWeekView()
            
            MonthGridView(
                currentMonth: currentMonth,
                selectedDate: $selectedDate,
                isExpanded: $isExpanded
            )
            
            if let selectedDate {
                DayDetailsView(date: selectedDate)
            }
        }
        .padding()
    }
}
