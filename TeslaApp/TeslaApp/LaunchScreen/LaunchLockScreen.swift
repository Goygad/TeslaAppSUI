//
//  LaunchLockScreen.swift
//  TeslaApp
//
//  Created by Balik on 14.05.2024.
//

import SwiftUI

struct LaunchLockScreen: View {
    
    // MARK: - Constants
    private enum Constants {
        
        static let lockedText = "Lock"
        static let unlockedText = "Unlock"
    }
    
    var body: some View {
        
        NavigationView {
            backgroungGradientLaunchLockStackView(isCarClosed: isCarClosed) {
                
                VStack {
                    buttonSettings
                    
                    NavigationLink(destination: MainTabView(), isActive: $isSettingsTapped) {
                        EmptyView()
                    }
                    
                    welcomeTextView
                    if isCarClosed { AnyView(imageCarClosed)
                    }
                    else {
                        AnyView(imageCarOpen)
                    }
                    
                    
                    closeCarControllView
                }
            }
        }
//        .navigation(destination: MainTabView(), isActive: $isSettingsTapped)

        .navigationBarBackButtonHidden(true)
    }
    
    @State private var isSettingsTapped = false
    @State private var isCarClosed = true
    @State private var shouldNavigate = false
    @State private var opacityOpenedCar = 0
    @State private var opacityClosedCar = 0
    
    
    
    private var buttonSettings: some View {
        Button {
            isSettingsTapped.toggle()
        } label: {
            Image(.gear)
                .circleButtonImageModifierStyle()
            
        }
        .circleButtonModifierStyle()
        .offset(x: 140, y: -60)
    }
    
    private var welcomeTextView: some View {
        VStack(spacing: 10) {
            Text("Hi")
                .foregroundColor(.gray)
            Text("Welcome back")
                .font(.system(size: 38, weight: .bold))
        }
        .opacity(isCarClosed ? 0 : 1)
    }
    
    private var imageCarOpen: some View {
        Image(.carFrontLight)
            .resizable()
            .frame( height: 310)
            .offset(x: 5)
            .frame(maxWidth: .infinity, maxHeight: 330)
            .shadow(color: .neon.opacity(0.3),  radius: 85)
    }
    
    private var imageCarClosed: some View {
        Image(.carFrontDark)
            .resizable()
            .frame( height: 280)
            .offset(y: -45)
            .frame(maxWidth: .infinity, maxHeight: 330)
    }
    
    
    private var closeCarControllView: some View {
        Button {
            
            withAnimation(.linear(duration: 1)) {
                isCarClosed.toggle()
            }
        } label: {
            HStack() {
                Text(isCarClosed ? Constants.lockedText : Constants.unlockedText)
                    .font(.system(size: 17, weight: .semibold))
                    .frame(width: 56)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                Image(isCarClosed ? .lockClose : .lockOpen)
                    .frame(width: 22, height: 22)
                    .padding()
                    .circleMenuButtonsStyle()
                
            }
            .padding()
        }
        .frame(width: 190)
        .pushedViewConfigurationStyle()
        
    }
}
    
                        
    
   


    #Preview {
        LaunchLockScreen()
            .environment(\.colorScheme, .dark)
    }
