//
//  EyebrowService.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import Foundation

enum EyebrowService: String, CaseIterable, Identifiable, ServiceProtocol {
    case browLamination = "Laminado de Cejas"
    case hennaTint = "Tinte con Henna"
    case eyebrowTint = "Tinte de Cejas"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .browLamination:
            return "El laminado de cejas redefine y fija la forma de tus cejas para un acabado impecable y natural."
        case .hennaTint:
            return "El tinte con henna es una técnica natural que da color y definición a tus cejas, durando varias semanas."
        case .eyebrowTint:
            return "El tinte de cejas es ideal para dar un toque de color y definición a tus cejas."
        }
    }
    
    var duration: TimeInterval {
        switch self {
        case .browLamination: return 3600 // 1 hora
        case .hennaTint: return 2700 // 45 minutos
        case .eyebrowTint: return 1800 // 30 minutos
        }
    }
    
    var price: Decimal {
        switch self {
        case .browLamination: return 40
        case .hennaTint: return 35
        case .eyebrowTint: return 20
        }
    }
}
