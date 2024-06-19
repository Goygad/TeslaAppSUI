//
//  MainTabView.swift
//  TeslaApp
//
//  Created by Balik on 18.05.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        CustomTabView(selection: $selectedTab) {
            VStack {
                
                if selectedTab == 0 {
                    MainView()
                } else {
                    ChargeView()
                }
            }
            .transition(.opacity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
        .environment(\.colorScheme, .dark)
}

