//
//  ColorSchemes.swift
//  PomoCloudo
//
//  Created by Kari Groszewska on 9/8/24.
//

import SwiftUI

extension Color {
    struct Focus {
        static let text = Color(red: 71/255, green: 21/255, blue: 21/255)
        static let background = Color(red: 255/255, green: 242/255, blue: 242/255)
        static let primaryButton = Color(red: 255/255, green: 76/255, blue: 76/255, opacity: 0.15)
        static let secondaryButton = Color(red: 255/255, green: 76/255, blue: 76/255, opacity: 0.71)
    }
    
    struct ShortBreak {
        static let text = Color(red: 20/255, green: 64/255, blue: 29/255)
        static let background = Color(red: 242/255, green: 255/255, blue: 245/255)
        static let primaryButton = Color(red: 77/255, green: 218/255, blue: 110/255, opacity: 0.15)
        static let secondaryButton = Color(red: 77/255, green: 218/255, blue: 110/255, opacity: 0.62)
    }
    
    struct LongBreak {
        static let text = Color(red: 21/255, green: 48/255, blue: 71/255)
        static let background = Color(red: 242/255, green: 249/255, blue: 255/255)
        static let primaryButton = Color(red: 76/255, green: 172/255, blue: 255/255, opacity: 0.15)
        static let secondaryButton = Color(red: 77/255, green: 218/255, blue: 110/255, opacity: 0.62)
    }
}
