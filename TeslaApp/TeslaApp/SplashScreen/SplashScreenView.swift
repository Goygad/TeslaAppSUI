//
//  SplashScreenView.swift
//  TeslaApp
//
//  Created by Balik on 15.05.2024.
//

import SwiftUI

// Экран SplashScreen
struct SplashScreenView: View {
    @State private var showUnlockScreen = false
    @State private var scaleFactor: CGFloat = 1.0
    @State private var scaleColor: Color = .black
    
    var body: some View {
        NavigationView {
            
     
            ZStack {
                    TeslaIcon()
                        .foregroundStyle(scaleColor)
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .offset(x: 50)
                        .scaleEffect(scaleFactor)
                        .animation(.easeInOut(duration: 1.5))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                withAnimation {
                                    scaleColor = .red
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    scaleColor = .black
                                    scaleFactor = 0.9
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                withAnimation {
                                    
                                    showUnlockScreen = true
                                }
                            }
                        }
                        .background(
                            
                            NavigationLink(destination: LaunchLockScreen(), isActive: $showUnlockScreen) {
                                EmptyView()
                            }
                        )
                }
                    }
        .background(Color.black)
        .ignoresSafeArea()
    }
  }

#Preview {
    SplashScreenView()
        .environment(\.colorScheme, .dark)
}

