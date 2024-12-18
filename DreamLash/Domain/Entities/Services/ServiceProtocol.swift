//
//  ServiceProtocol.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import Foundation

protocol ServiceProtocol: Identifiable, CaseIterable {
    var id: String { get }
    var description: String { get }
    var duration: TimeInterval { get }
    var price: Decimal { get }
}
