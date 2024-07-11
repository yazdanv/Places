//
//  Color+Extension.swift
//  Places
//
//  Created by Yazdan Vakili on 10/07/2024.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
