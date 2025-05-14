//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 10/05/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(MockData().coin)
            self.portfolioCoins.append(MockData().coin)
        }
    }
}
