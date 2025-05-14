//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 10/05/2025.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
