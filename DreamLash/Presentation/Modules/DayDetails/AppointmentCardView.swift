//
//  AppointmentCardView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct AppointmentCardView: View {
    let appointment: Appointment

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(appointment.timeRangeString)
                .font(.caption)
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .padding(6)
        .background(Color.blue.opacity(0.8))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    AppointmentCardView(appointment: Appointment.mocks[0])
}
