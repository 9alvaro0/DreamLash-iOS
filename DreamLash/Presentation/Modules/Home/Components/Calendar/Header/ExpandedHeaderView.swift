//
//  ExpandedHeaderView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct ExpandedHeaderView: View {
    @Binding var currentMonth: Date
    
    var body: some View {
        HStack {
            monthInfoView
            Spacer()
            navigationButtonsView
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
    
    // MARK: - NavigationButtonsView
    private var navigationButtonsView: some View {
        HStack(spacing: 16) {
            Button {
                currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth) ?? currentMonth
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundColor(.brown.opacity(0.7))
            }
            
            Button {
                currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth) ?? currentMonth
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundColor(.brown.opacity(0.7))
            }
        }
    }
}


