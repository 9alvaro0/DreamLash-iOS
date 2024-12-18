//
//  Treatment.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import Foundation

struct Treatment: Identifiable {
    let id: UUID
    var name: String
    var duration: TimeInterval
    var price: Double
    var description: String
}
