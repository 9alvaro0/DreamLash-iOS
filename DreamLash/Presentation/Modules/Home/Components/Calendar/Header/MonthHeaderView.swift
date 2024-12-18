//
//  MonthHeaderView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

// MARK: - MonthHeaderView
struct MonthHeaderView: View {
    @Binding var currentMonth: Date
    @Binding var isExpanded: Bool
    @Binding var selectedDate: Date?

    var body: some View {
        VStack {
            if isExpanded {
                ExpandedHeaderView(currentMonth: $currentMonth)
            } else {
                CollapsedHeaderView(
                    currentMonth: currentMonth,
                    isExpanded: $isExpanded,
                    selectedDate: $selectedDate
                )
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.brown.opacity(0.1))
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.brown.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    MonthHeaderView(
        currentMonth: .constant(Date()),
        isExpanded: .constant(true),
        selectedDate: .constant(nil)
    )
}
