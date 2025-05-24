//
//  String.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 23/05/2025.
//

import Foundation

extension String {

    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
