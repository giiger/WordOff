//
//  WordOffApp.swift
//  WordOff
//
//  Created by Alexander Giger on 2/9/23.
//

import SwiftUI

@main
struct WordOffApp: App {
    @StateObject var dm = WordOffDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
