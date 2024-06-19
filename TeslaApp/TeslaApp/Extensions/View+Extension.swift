//
//  View+Extension.swift
//  TeslaApp
//
//  Created by Balik on 13.05.2024.
//

import SwiftUI

extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
    func neumorphismGradient() -> some View {
        modifier(NeumorphismGradient())
    }
    
    func neumorphismNavButtons() -> some View {
        modifier(NeumorphismNavButtons())
    }
    
    func neumorphismUnSelectedNavButtonsStyle() -> some View {
        modifier(NeumorphismUnSelectedNavButtons())
    }
    
    func circleMenuButtonsStyle() -> some View {
        modifier(CircleMenuButtons())
    }
    
    func circleButtonModifierStyle() -> some View {
        modifier(CircleButtonModifier())
    }
    
    func climateCircleSettingStyle() -> some View {
        modifier(ClimateCircleSettingModifier())
    }

    func circleButtonImageModifierStyle() -> some View {
        modifier(CircleButtonImageModifier())
    }
    
    func lockButtonConfigurationStyle() -> some View {
        modifier(LockButtonConfiguration())
    }
    
    func pushedViewConfigurationStyle() -> some View {
        modifier(PushedViewConfiguration())
    }
    
    func climateCircleIndicatorConfiguration() -> some View {
        modifier(ClimateCircleIndicatorModifier())
    }
    
    func tabBarShadowStyle() -> some View {
        modifier(TabBarModifier())
    }
    
    func dropMenuCircleButtonStyle() -> some View {
        modifier(dropMenuButtonCircleButtonImageModifier())
    }
    
    
    func backgroungStackView<Content: View>(content:() -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.lightShadow, .externalDark], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            content()
        }
    }
    
    func backgroungGradientLaunchLockStackView<Content: View>(isCarClosed: Bool, content:() -> Content) -> some View {
        ZStack {
        if isCarClosed {
        Rectangle()
            .fill(LinearGradient(colors: [.topLaunchBack, .bodyLaunchBack, .bottomLaunchBack], startPoint: .bottom, endPoint: .top))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        } else {
        Rectangle()
             .fill(LinearGradient(colors: [.bottomLaunchOpen, .topLaunchOpen, .bottomLaunchOpen], startPoint: .bottom, endPoint: .top))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
                    }
        content()
    }
    }
    
    
}
