//
//  HourRowView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct HourRowView: View {
    let hour: String

    var body: some View {
        HStack {
            Text(hour)
                .font(.headline)
                .frame(width: 60, alignment: .leading)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 40)
        }
        .padding(.horizontal)
    }
}
