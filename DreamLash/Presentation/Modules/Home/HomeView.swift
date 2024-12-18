//
//  HomeView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 13/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var router = HomeRouter()
    @State private var selectedDate: Date?
    let myNextAppointment: Appointment = Appointment.mocks[0]
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        CalendarView(selectedDate: $selectedDate)
                        
                        if selectedDate == nil {
                            MyAppointmentsView(
                                appointment: myNextAppointment
                            )
                            .frame(maxHeight: .infinity)
                        }
                    }
                }
            }
            .environment(router)
            .navigationDestination(for: HomeRouter.Route.self) { route in
                router.view(for: route)
            }
        }
    }
}

#Preview {
    HomeView()
}
