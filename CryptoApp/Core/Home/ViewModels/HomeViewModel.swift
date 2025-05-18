//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 10/05/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var statistics: [Statistic] = [
        Statistic(title: "Mock1", value: "$12Bn", percantageChange: 10.4),
        Statistic(title: "Mock2", value: "$17Tr"),
        Statistic(title: "Mock3", value: "$10.5Bn"),
        Statistic(title: "Mock4", value: "$12Bn", percantageChange: -10.4)
    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataService.$allCoins
//            .sink { [weak self] (returnedCoins) in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
