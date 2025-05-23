//
//  DetailView.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 23/05/2025.
//

import SwiftUI


struct DetailLoadingView: View {
    @Binding var coin: Coin?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: MockData().coin)
}
