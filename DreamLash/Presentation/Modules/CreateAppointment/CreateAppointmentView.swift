//
//  CreateAppointmentView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 17/12/24.
//


import SwiftUI

struct CreateAppointmentView: View {
    enum Step: Int, CaseIterable {
        case confirmDate
        case selectService
        case payment
        case confirmation
    }
    
    let dateInterval: DateInterval
    private var startDate: Date {
          dateInterval.start
    }
    
    @Environment(HomeRouter.self) var router
    @State private var currentStep: Step = .confirmDate
    @State private var selectedService: ServiceType?
    @State private var paymentSuccess: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            progressView
            
            currentStepView()
            
            Spacer()
            
            navigationButtons
        }
        .navigationTitle(titleForStep())
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
    
    private var progressView: some View {
        VStack(spacing: 8) {
            ProgressView(value: Double(currentStep.rawValue + 1), total: Double(Step.allCases.count))
                .progressViewStyle(.linear)
                .accentColor(.brown)
            
            HStack {
                ForEach(Step.allCases, id: \.self) { step in
                    Text(titleForStep(step))
                        .font(.caption2)
                        .foregroundColor(step.rawValue <= currentStep.rawValue ? .brown : .gray)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func currentStepView() -> some View {
        switch currentStep {
        case .confirmDate:
            ConfirmDateView(date: startDate)
        case .selectService:
            ServiceSelectionView(selectedService: $selectedService)
        case .payment:
            PaymentView(onPaymentSuccess: {
                paymentSuccess = true
                nextStep()
            })
        case .confirmation:
            ConfirmationView(date: startDate, selectedService: selectedService)
        }
    }
    
    private var navigationButtons: some View {
        HStack {
            if currentStep != .confirmDate {
                Button(action: previousStep) {
                    Text("Atrás")
                        .foregroundColor(.brown)
                        .padding()
                        .background(Color.brown.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            
            Spacer()
            
            Button(action: nextStep) {
                Text(currentStep == .confirmation ? "Finalizar" : "Siguiente")
                    .foregroundColor(.white)
                    .padding()
                    .background(canProceedToNextStep() ? Color.brown : Color.gray)
                    .cornerRadius(8)
            }
            .disabled(!canProceedToNextStep())
        }
    }
    
    private func nextStep() {
        if let nextStep = Step(rawValue: currentStep.rawValue + 1) {
            withAnimation {
                currentStep = nextStep
            }
        } else if currentStep == .confirmation {
            router.navigateToRoot()
        }
    }
    
    private func previousStep() {
        if let previousStep = Step(rawValue: currentStep.rawValue - 1) {
            withAnimation {
                currentStep = previousStep
            }
        }
    }
    
    private func canProceedToNextStep() -> Bool {
        switch currentStep {
        case .confirmDate:
            return true
        case .selectService:
            return selectedService != nil
        case .payment:
            return paymentSuccess
        case .confirmation:
            return true
        }
    }
    
    private func titleForStep(_ step: Step? = nil) -> String {
        let currentStep: Step?
        if step == nil {
            currentStep = self.currentStep
        } else {
            currentStep = step
        }
        switch currentStep {
        case .confirmDate:
            return "Fecha"
        case .selectService:
            return "Servicio"
        case .payment:
            return "Pago"
        case .confirmation:
            return "Confirmar"
        case .none:
            return ""
        }
    }
}

#Preview {
    CreateAppointmentView(dateInterval: .init())
}
