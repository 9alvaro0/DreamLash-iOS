//
//  WaxingService.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

enum WaxingService: String, CaseIterable, Identifiable, ServiceProtocol {
    case fullFace = "Depilación Rostro Completo"
    case upperLip = "Depilación Labio Superior"
    case eyebrowWaxing = "Depilación de Cejas"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .fullFace:
            return "Depilación completa del rostro, eliminando el vello no deseado para un acabado limpio y suave."
        case .upperLip:
            return "Elimina el vello del labio superior para un aspecto impecable y limpio."
        case .eyebrowWaxing:
            return "Define y limpia tus cejas con precisión a través de técnicas de depilación especializadas."
        }
    }
    
    var duration: TimeInterval {
        switch self {
        case .fullFace: return 2700 // 45 minutos
        case .upperLip: return 900 // 15 minutos
        case .eyebrowWaxing: return 1800 // 30 minutos
        }
    }
    
    var price: Decimal {
        switch self {
        case .fullFace: return 30
        case .upperLip: return 5
        case .eyebrowWaxing: return 15
        }
    }
}
