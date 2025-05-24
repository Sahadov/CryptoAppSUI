//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 23/05/2025.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    
    @Published var coin: Coin
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map({ (coinDetail, coin) -> (overview: [Statistic], additional: [Statistic]) in
                // overview
                let price = coin.currentPrice.asCurrencyWith2Decimals()
                let pricePercantageChange = coin.priceChangePercentage24H
                let priceStat = Statistic(title: "Current Price", value: price, percantageChange: pricePercantageChange)
                
                let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
                let marketCapPercentChange = coin.marketCapChangePercentage24H
                let marketCapStat = Statistic(title: "Market Capitalization", value: marketCap, percantageChange: marketCapPercentChange)
                
                let rank = "\(coin.rank)"
                let rankStat = Statistic(title: "Rank", value: rank)
                
                let volume = "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
                let volumeStat = Statistic(title: "Volume", value: volume)
                
                let overviewArray: [Statistic] = [
                    priceStat, marketCapStat, rankStat, volumeStat
                ]
                
                // additional
                let high = coin.high24H?.asCurrencyWith2Decimals() ?? "n/a"
                let highStat = Statistic(title: "24h High", value: high)
                
                let low = coin.low24H?.asCurrencyWith2Decimals() ?? "n/a"
                let lowStat = Statistic(title: "24h Low", value: low)
                
                let priceChange = coin.priceChange24H?.asCurrencyWith2Decimals() ?? "n/a"
                let pricePercentChange2 = coin.priceChangePercentage24H
                let priceChangeStat = Statistic(title: "24h Price Change", value: priceChange, percantageChange: pricePercentChange2)
                
                let marketCapChange = "$" + (coin.marketCapChange24H?.formattedWithAbbreviations() ?? "")
                let marketCapPercentChange2 = coin.marketCapChangePercentage24H
                let marketCapChangeStat = Statistic(title: "24h Market Cap Change", value: marketCapChange, percantageChange: marketCapPercentChange2)
                
                let blockTime = coinDetail?.blockTimeInMinutes ?? 0
                let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
                let blockStat = Statistic(title: "Block Time", value: blockTimeString)
                
                let hashing = coinDetail?.hashingAlgorithm ?? "n/a"
                let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)
                
                let additionalArray: [Statistic] = [
                    highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
                ]
                
                return (overviewArray, additionalArray)
                
            })
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
    }
}
