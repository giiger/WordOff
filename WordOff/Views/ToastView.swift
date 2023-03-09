//
//  ToastView.swift
//  WordOff
//
//  Created by Alexander Giger on 2/25/23.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastText: "Not in word list.")
    }
}
