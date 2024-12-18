//
//  Calendar+Extensions.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import Foundation

extension Calendar {
    /// Retorna el inicio del día laboral (7 AM) para una fecha dada
    func startOfBusinessDay(for date: Date) -> Date {
        return self.date(bySettingHour: 7, minute: 0, second: 0, of: date)!
    }
}
