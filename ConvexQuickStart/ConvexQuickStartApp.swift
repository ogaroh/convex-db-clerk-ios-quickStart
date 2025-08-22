//
//  ConvexQuickStartApp.swift
//  ConvexQuickStart
//
//  Created by BURN Mfg on 22/08/2025.
//

import SwiftUI
import SwiftData
import Clerk

@main
struct ConvexQuickStartApp: App {
    @State private var clerk = Clerk.shared
    
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if(clerk.isLoaded) {
                    ContentView()
                } else {
                    ProgressView()
                }
            }
            .environment(clerk)
            .task {
                clerk.configure(publishableKey: "pk_test_aW50ZXJuYWwtbWFybGluLTUzLmNsZXJrLmFjY291bnRzLmRldiQ") // TODO: check this
                try? await clerk.load()
            }
        }
    }
}
