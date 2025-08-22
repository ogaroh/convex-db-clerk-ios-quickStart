//
//  ContentView.swift
//  ConvexQuickStart
//
//  Created by BURN Mfg on 22/08/2025.
//

import SwiftUI
import Clerk

struct ContentView: View {
    @Environment(Clerk.self) private var clerk
    
    var body: some View {
        ZStack {
            if clerk.user != nil {
                TodoView()
            } else {
                SignUpOrSignInView()
            }
        }
    }
}

#Preview {
    ContentView()
}

