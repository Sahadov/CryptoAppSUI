//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 20/05/2025.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationStack {
            SearchBarView(searchText: $vm.searchText)
                .padding()
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(vm.allCoins) { coin in
                        Text(coin.symbol.uppercased())
                    }
                }
            }
            .navigationTitle("Edit portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}
