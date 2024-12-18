//
//  Appointment.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct Appointment: Identifiable, Hashable {
    let id: UUID
    var userId: UUID
    var treatmentId: UUID
    var treatmentName: String
    var clientName: String
    var startTime: Date
    var endTime: Date
    var isConfirmed: Bool
    var notes: String?
    
    init(
        userId: UUID,
        treatmentId: UUID,
        treatmentName: String,
        clientName: String,
        startTime: Date,
        duration: TimeInterval
    ) {
        self.id = UUID()
        self.userId = userId
        self.treatmentId = treatmentId
        self.treatmentName = treatmentName
        self.clientName = clientName
        self.startTime = startTime
        self.endTime = startTime.addingTimeInterval(duration)
        self.isConfirmed = false
        self.notes = nil
    }
    
    func overlaps(with other: Appointment) -> Bool {
        return (self.startTime < other.endTime && self.endTime > other.startTime)
    }
    
    var duration: TimeInterval {
        return endTime.timeIntervalSince(startTime)
    }
    
    var durationInMinutes: Int {
        return Int(duration / 60)
    }
    
    var timeRangeString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "\(formatter.string(from: startTime)) - \(formatter.string(from: endTime))"
    }
}
