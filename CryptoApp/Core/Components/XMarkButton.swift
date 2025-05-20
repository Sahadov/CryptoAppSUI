//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Dmitry Volkov on 20/05/2025.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button (action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
