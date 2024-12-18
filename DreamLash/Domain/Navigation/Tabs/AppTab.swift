//
//  AppTab.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

enum AppTab: String, CaseIterable, Identifiable {
    case home = "Inicio"
    case services = "Servicios"
    case profile = "Perfil"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .services:
            return "scissors"
        case .profile:
            return "person.circle"
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .services:
            Text("Servicios")
        case .profile:
            Text("Perfil")
        }
    }
}
