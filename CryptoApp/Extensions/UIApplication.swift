//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 17/05/2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    // Dismiss keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
