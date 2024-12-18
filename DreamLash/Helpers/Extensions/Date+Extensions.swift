//
//  Date+Extensions.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import Foundation

extension Date {
    /// Nombres cortos de los días de la semana, empezando por lunes.
    static var shortWeekdaySymbolsStartingOnMonday: [String] {
        let calendar = Calendar.current
        let symbols = calendar.shortWeekdaySymbols
        let mondayStartIndex = 1
        let reorderedSymbols = Array(symbols[mondayStartIndex...] + symbols[..<mondayStartIndex])
        return reorderedSymbols
    }
    
    /// Devuelve el nombre del mes para una fecha.
    var monthString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self).capitalized
    }
    
    /// Devuelve el año para una fecha.
    var yearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }
    
    /// Devuelve el rango de días en el mes de la fecha actual.
    func daysInMonth() -> [Date] {
        guard let range = Calendar.current.range(of: .day, in: .month, for: self) else { return [] }
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        return range.compactMap { Calendar.current.date(byAdding: .day, value: $0 - 1, to: startOfMonth) }
    }
    
    /// Devuelve los días de la semana de la fecha actual.
    func daysInWeek() -> [Date] {
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return [] }
        return (0..<7).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    /// Devuelve el día de la semana de la fecha actual.
    func weekdayOffset(firstWeekday: Int = Calendar.current.firstWeekday) -> Int {
        let weekdayOffset = Calendar.current.component(.weekday, from: self) - firstWeekday
        return (weekdayOffset + 7) % 7
    }
    
    /// Comprueba si la fecha pertenece a la misma semana que otra fecha.
    func isInSameWeek(as date: Date) -> Bool {
        let currentWeek = Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        let otherWeek = Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return currentWeek == otherWeek
    }
}
