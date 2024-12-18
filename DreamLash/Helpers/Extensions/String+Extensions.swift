//
//  String+Extensions.swift
//  DreamLash
//
//  Created by Alvaro Guerra Freitas on 16/12/24.
//

import Foundation

extension String {
    var capitalizedFirstLetter: String {
        prefix(1).uppercased() + dropFirst()
    }
}
