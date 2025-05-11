//
//  HomeView.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 10/05/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .toolbar(.hidden)
    }
}
