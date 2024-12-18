//
//  DaysInWeekView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct DaysInWeekView: View {
    private let days: [String] = Date.shortWeekdaySymbolsStartingOnMonday
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(days, id: \.self) { day in
                Text(day.capitalizedFirstLetter)
                    .font(.caption)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(.brown.opacity(0.8))
            }
        }
        .padding(8)
    }
}


#Preview {
    DaysInWeekView()
}
