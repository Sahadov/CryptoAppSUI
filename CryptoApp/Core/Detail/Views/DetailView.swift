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
    @StateObject private var vm: DetailViewModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text("HEY")
    }
}

#Preview {
    DetailView(coin: MockData().coin)
}
