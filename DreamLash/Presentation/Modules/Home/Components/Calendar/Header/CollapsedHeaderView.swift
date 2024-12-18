//
//  CollapsedHeaderView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct CollapsedHeaderView: View {
    let currentMonth: Date
    @Binding var isExpanded: Bool
    @Binding var selectedDate: Date?

    var body: some View {
        Button {
            withAnimation(.spring()) {
                isExpanded = true
                selectedDate = nil
            }
        } label: {
            HStack {
                monthInfoView
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundColor(.brown.opacity(0.7))
            }
        }
    }
    
    private var monthInfoView: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(currentMonth.yearString)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.brown.opacity(0.8))
            
            Text(currentMonth.monthString)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.brown)
        }
    }
}
