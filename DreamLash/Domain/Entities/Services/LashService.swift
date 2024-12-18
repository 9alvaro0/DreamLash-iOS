//
//  LashService.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

import SwiftUI

enum LashService: String, CaseIterable, Identifiable, ServiceProtocol {
    case classic = "Pelo a Pelo"
    case technological = "Tecnológico"
    case hybrid = "Híbrido"
    case russian3D = "Ruso 3D"
    case russian5D = "Ruso 5D"
    case lashLifting = "Lifting de Pestañas"
    case liftingAndTint = "Lifting + Tinte"
    case eyelashTint = "Tinte de Pestañas"
    
    var id: String { rawValue }
    
    var description: String {
        switch self {
        case .classic:
            return "La técnica pelo a pelo permite una aplicación meticulosa de extensiones individuales en cada pestaña natural, logrando un aspecto elegante y natural."
        case .technological:
            return "Esta técnica avanzada utiliza las últimas innovaciones en extensiones de pestañas para crear un volumen personalizado y duradero."
        case .hybrid:
            return "Combinación perfecta entre volumen y naturalidad, mezclando técnicas para un resultado personalizado."
        case .russian3D:
            return "El Volumen Ruso 3D multiplica el efecto de tus pestañas, aplicando abanicos de 3 extensiones en cada pestaña natural para un efecto dramático."
        case .russian5D:
            return "El Volumen Ruso 5D ofrece un efecto máximo de volumen y densidad con abanicos de 5 extensiones por pestaña natural."
        case .lashLifting:
            return "El lifting de pestañas da un aspecto curvado y natural a tus pestañas sin necesidad de extensiones."
        case .liftingAndTint:
            return "Un lifting combinado con un tinte de pestañas para un efecto completo y llamativo."
        case .eyelashTint:
            return "El tinte de pestañas intensifica el color natural, logrando un efecto más oscuro y definido."
        }
    }
    
    var duration: TimeInterval {
        switch self {
        case .classic: return 7200 // 2 horas
        case .technological: return 7200 // 2 horas
        case .hybrid: return 8100 // 2 horas y 15 minutos
        case .russian3D: return 9000 // 2 horas y 30 minutos
        case .russian5D: return 10800 // 3 horas
        case .lashLifting: return 3600 // 1 hora
        case .liftingAndTint: return 4500 // 1 hora y 15 minutos
        case .eyelashTint: return 1800 // 30 minutos
        }
    }
    
    var price: Decimal {
        switch self {
        case .classic: return 59
        case .technological: return 60
        case .hybrid: return 69
        case .russian3D: return 79
        case .russian5D: return 89
        case .lashLifting: return 40
        case .liftingAndTint: return 50
        case .eyelashTint: return 20
        }
    }
}
