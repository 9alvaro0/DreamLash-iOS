//
//  ServiceSelectionView.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import SwiftUI

struct ServiceSelectionView: View {
    @Binding var selectedService: ServiceType?
    @State private var selectedCategory: ServiceType.Category = .lash
    @State private var popoverService: ServiceType?
    
    var body: some View {
        VStack(spacing: 20) {
            categoryPicker
            serviceList
        }
        .padding(.horizontal)
    }
    
    private var categoryPicker: some View {
        Picker("Categoría", selection: $selectedCategory) {
            ForEach(ServiceType.Category.allCases) { category in
                Text(category.rawValue).tag(category)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var serviceList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(ServiceType.services(for: selectedCategory)) { service in
                    serviceCard(for: service)
                }
            }
        }
    }
    
    private func serviceCard(for service: ServiceType) -> some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text(service.name)
                    .font(.headline)
                    .foregroundColor(.brown)
                
                HStack(alignment: .bottom) {
                    Text(service.description)
                        .font(.subheadline)
                        .foregroundColor(.brown.opacity(0.8))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    Button {
                        popoverService = service
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.brown)
                            .font(.title3)
                    }
                    .popover(item: $popoverService) { selectedService in
                        popoverContent(for: selectedService)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(Double(truncating: service.price as NSNumber), specifier: "%.2f")€")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                
                Text("\(service.duration / 60) min")
                    .font(.caption)
                    .foregroundColor(.brown.opacity(0.6))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(selectedService == service ? Color.brown : Color.clear, lineWidth: 2)
        )
        .onTapGesture {
            selectedService = service
        }
    }
    
    private func popoverContent(for service: ServiceType) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(service.name)
                .font(.headline)
                .foregroundColor(.brown)
            
            Text(service.description)
                .font(.body)
                .foregroundColor(.brown.opacity(0.8))
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    @Previewable
    @State var selectedService: ServiceType?
    ServiceSelectionView(
        selectedService: $selectedService
    )
}

