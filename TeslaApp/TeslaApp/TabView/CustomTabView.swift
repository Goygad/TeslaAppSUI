//
//  CustomTabView.swift
//  TeslaApp
//
//  Created by Balik on 18.05.2024.
//

import SwiftUI

struct CustomTabView<Content: View>: View {
    @Binding var selection: Int
    
    @Namespace private var tabBarItem
    
    private var tabs: [CustomTabItem] = [
        .init(icon: "carIcon"),
        .init(icon: "flash"),
        .init(icon: "antena"),
        .init(icon: "profile")
    ]
    
    private var content: Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            VStack(spacing: -15) {
                tabsView
            }
        }
    }
    
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
    private var tabsView: some View {
        ZStack {
            CustomTabViewShape()
                .fill(.climateIndicatorGradientDark)
                .tabBarShadowStyle()
            HStack(spacing: 40) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
                    Image(element.icon)
                        .renderingMode(.template)
                        .foregroundColor(selection == index ? .topGradient : .white)
                        .frame(width: 40, height: 40)
                        .background(
                            ZStack {
                                if selection == index {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)
                                        .shadow(color: .topGradient.opacity(1), radius: 20, x: 0, y: 0)
                                        .transition(.opacity)
                                }
                            }
                                .shadow(color: .topGradient, radius: 10, x: 0, y: 0)
                        )
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                    if index == 1 {
                        Spacer()
                            .frame(width: 40)
                    }
                }
            }
        }
        .frame(height: 100)
    }
}


#Preview {
    MainTabView()
        .environment(\.colorScheme, .dark)
}

