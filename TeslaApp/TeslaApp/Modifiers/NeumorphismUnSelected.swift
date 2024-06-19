//
//  NeumorphismUnSelected.swift
//  TeslaApp
//
//  Created by Balik on 13.05.2024.
//

import SwiftUI

struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 3, x: -3, y: -3)
            .shadow(color: .darkShadow, radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismUnSelectedNavButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadowCircular, radius: 8, x: -4, y: -4)
            .shadow(color: .darkShadow, radius: 8, x: 4, y: 4)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: -5)
    }
}

struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(Color(.backgroundMain)))
            .neumorphismUnSelectedStyle()
    }
}
    
    struct NeumorphismGradient: ViewModifier {
        func body(content: Content) -> some View {
            content
            LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
        }
    }

struct CircleButtonImageModifier: ViewModifier {
    var gradient = LinearGradient(colors: [.externalLight, .externalDark], startPoint: .top, endPoint: .bottom)
    func body(content: Content) -> some View {
        content
            .frame(width: 30, height: 30)
            .padding(.all, 20)
            .background(Circle().fill(gradient))
            .shadow(color: .externalLight.opacity(1), radius: 10, x: -4, y: -8)
            .shadow(color: .circularDark.opacity(0.8), radius: 10, x: 3, y: 2)
            .overlay {
                Circle()
                    .stroke(settingsGradient, lineWidth: 2.5)
            }
    }
    private var settingsGradient: LinearGradient {
        LinearGradient(colors: [.circularDark.opacity(0.5), .circularLight.opacity(0.6)], startPoint: .topLeading
                       , endPoint: .bottomTrailing)
    }
}
   
struct NeumorphismNavButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .externalLight, radius: 5, x: -10, y: -10)
            .shadow(color: .externalDark, radius: 5, x: 10, y: 10)
    }
}

struct CircleButtonModifier: ViewModifier {
    var gradient = LinearGradient(colors: [.externalLight, .circleButtonGradientBottom], startPoint: .top, endPoint: .bottom)
    func body(content: Content) -> some View {
        content
            .shadow(color: .externalLight, radius: 10, x: 0, y: 0)
            .shadow(color: .circularDark.opacity(0.8), radius: 8, x: 6, y: 9)
            
    }
}

struct CircleMenuButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                Circle()
                    .stroke(.lockButtonGradientTop.opacity(0.1), lineWidth: 1)
            }
            .background(
                Circle()
                    .fill(
                        unlockedBackgroundGradient
                            .shadow(.inner(color: .settingsButton, radius: 1, x: -0.5, y: -0.5))
                            .shadow(.inner(color: .lockBackground, radius: 5, x: 5, y: 5))
                    )
            )
            .lockButtonConfigurationStyle()
    }
    
    private var unlockedBackgroundGradient: LinearGradient {
        LinearGradient(colors: [.unlockedGradientTop, .unlockedGradientBottom], startPoint: .top, endPoint: .bottom)
    }
}

struct LockButtonConfiguration: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 3)
            .background(Circle().fill(.darkShadow))
    }
}


struct PushedViewConfiguration: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        .lockButtonGradientTop
                            .shadow(.inner(color: .lockedGradientTop, radius: 6, x: -10, y: -10))
                            .shadow(.inner(color: .lockedGradientMiddle, radius: 5, x: 5, y: 0))
                    )
            )
    }
}

struct ClimateCircleIndicatorModifier: ViewModifier {
    var gradient = LinearGradient(colors: [.circleButtonGradientTop, .circleButtonGradientBottom], startPoint: .top, endPoint: .bottom)
    func body(content: Content) -> some View {
        content
            .shadow(color: .circleButtonGradientTop, radius: 20, x: -10, y: -10)
            .shadow(color: .lockedGradientMiddle.opacity(0.7), radius: 20, x: 20, y: 20)
            
    }
}

struct ClimateCircleSettingModifier: ViewModifier {
     var climateBackgroundGradient: LinearGradient {
        LinearGradient(colors: [.lockButtonGradientBottom,/* .unlockedGradientTop,*/ .unlockedGradientBottom], startPoint: .top, endPoint: .bottom)
    }
    func body(content: Content) -> some View {
        content
            .padding(.all, 15)
            .background(Circle().fill(climateBackgroundGradient))
            .shadow(color: .lockedGradientMiddle, radius: 5, x: 3, y: 3)
            
    }
}

struct TabBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lockedGradientTop, radius: 5, x: 0, y: -5)
            .shadow(color: .lockedGradientMiddle.opacity(1), radius: 3, x: 0, y: 5)
    }
}

struct dropMenuButtonCircleButtonImageModifier: ViewModifier {
    var gradient = LinearGradient(colors: [.dropMenuButtonGradientTop, .dropMenuButtonGradientBottom], startPoint: .top, endPoint: .bottom)
    func body(content: Content) -> some View {
        content
            .padding(.all, 20)
            .background(Circle().fill(gradient))
            .shadow(color: .circleButtonGradientTop.opacity(0.8), radius: 10, x: -5, y: -8)
            .shadow(color: .circleButtonGradientTop.opacity(0.7), radius: 2, x: 1, y: 1)
            .shadow(color: .lockedGradientMiddle.opacity(0.8), radius: 8, x: 3, y: 3)
            
    }
}


    

