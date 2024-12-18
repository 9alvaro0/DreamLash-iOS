//
//  HomeRouter.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 17/12/24.
//

import SwiftUI

@Observable
class HomeRouter {
    enum Route: Hashable {
        case createAppointment(DateInterval)
        case postpone(Appointment)
    }
    
    var navigationPath = NavigationPath()
    
    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
    
    func navigateToRoot() {
        navigationPath = .init()
    }
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .createAppointment(let dateInterval):
            CreateAppointmentView(dateInterval: dateInterval)
                .toolbar(.hidden, for: .tabBar)
                .environment(self)
        case .postpone(let appointment):
            PostponeAppointmentView(appointment: appointment)
                .environment(self)
        }
    }
}



