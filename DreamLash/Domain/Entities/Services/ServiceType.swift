//
//  ServiceType.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

enum ServiceType: Equatable, Identifiable {
    case lash(LashService)
    case eyebrow(EyebrowService)
    case waxing(WaxingService)
    
    var id: String {
        switch self {
        case .lash(let service): return "lash-\(service.id)"
        case .eyebrow(let service): return "eyebrow-\(service.id)"
        case .waxing(let service): return "waxing-\(service.id)"
        }
    }
    
    var name: String {
        switch self {
        case .lash(let service): return service.rawValue
        case .eyebrow(let service): return service.rawValue
        case .waxing(let service): return service.rawValue
        }
    }
    
    var description: String {
        switch self {
        case .lash(let service): return service.description
        case .eyebrow(let service): return service.description
        case .waxing(let service): return service.description
        }
    }
    
    var duration: TimeInterval {
        switch self {
        case .lash(let service): return service.duration
        case .eyebrow(let service): return service.duration
        case .waxing(let service): return service.duration
        }
    }
    
    var price: Decimal {
        switch self {
        case .lash(let service): return service.price
        case .eyebrow(let service): return service.price
        case .waxing(let service): return service.price
        }
    }
    
    static var allServices: [ServiceType] {
        let lashServices = LashService.allCases.map { ServiceType.lash($0) }
        let eyebrowServices = EyebrowService.allCases.map { ServiceType.eyebrow($0) }
        let waxingServices = WaxingService.allCases.map { ServiceType.waxing($0) }
        return lashServices + eyebrowServices + waxingServices
    }
    
    static func services(for category: Category) -> [ServiceType] {
        switch category {
        case .lash: return LashService.allCases.map { .lash($0) }
        case .eyebrow: return EyebrowService.allCases.map { .eyebrow($0) }
        case .waxing: return WaxingService.allCases.map { .waxing($0) }
        }
    }
    
    enum Category: String, CaseIterable, Identifiable {
        case lash = "Pestañas"
        case eyebrow = "Cejas"
        case waxing = "Depilación"
        
        var id: String { rawValue }
    }
}
