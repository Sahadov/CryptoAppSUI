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
    let spacing: CGFloat = 5
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                
                Text("Overview")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .leading,
                          spacing: nil,
                          pinnedViews: [],
                          content: {
                    ForEach(0..<6) { _ in
                        StatisticView(stat: Statistic(title: "Title", value: "value"))
                    }
                    
                })
                
                Text("Additional Details")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .leading,
                          spacing: spacing,
                          pinnedViews: [],
                          content: {
                    ForEach(0..<6) { _ in
                        StatisticView(stat: Statistic(title: "Title", value: "value"))
                    }
                    
                })
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: MockData().coin)
    }
}
