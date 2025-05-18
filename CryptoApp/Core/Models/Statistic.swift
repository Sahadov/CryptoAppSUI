//
//  Statistic.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 17/05/2025.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percantageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percantageChange
    }
}
