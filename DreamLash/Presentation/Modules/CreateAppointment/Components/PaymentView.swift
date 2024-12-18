//
//  PaymentView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 17/12/24.
//


import SwiftUI

struct PaymentView: View {
    let onPaymentSuccess: () -> Void
    
    var body: some View {
        VStack {
            Text("Pasarela de Pago")
                .font(.headline)
            Spacer()
            Button(action: {
                onPaymentSuccess()
            }) {
                Text("Pagar y Reservar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
