//
//  CustomChargingSlider.swift
//  TeslaApp
//
//  Created by Balik on 19.05.2024.
//

import SwiftUI

struct CustomChargingSlider: View {
    @Binding var chosenLimitValue: Double
    @State private var sliderWidth: CGFloat = 0
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            let knobWidth: CGFloat = 20
            let availableWidth = geometry.size.width - knobWidth
            
            ZStack {
                Capsule()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("Color3").opacity(1),Color("Color3").opacity(0.5), Color("Color4"), Color("Color4")]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(height: 12)
                
                HStack {
                    triangleView
                        .offset(x: 10 + CGFloat(chosenLimitValue / 100) * availableWidth - knobWidth / 2)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newValue = gesture.location.x / availableWidth * 100
                                    chosenLimitValue = min(max(newValue, 0), 100)
                                }
                        )
                    Spacer()
                }
                .frame(width: geometry.size.width)
                
                HStack {
                    chosenLimitValuePercentageView
                        .offset(x: 16 + CGFloat(chosenLimitValue / 100) * availableWidth - 100 / 2, y: -30)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newValue = gesture.location.x / availableWidth * 100
                                    chosenLimitValue = min(max(newValue, 0), 100)
                                }
                        )
                    Spacer()
                }
                .frame(width: geometry.size.width)
                
                fullChargedView
            }
            .frame(width: 300, height: 40)
        }
    }
    
    // MARK: - Visual Elements
    
    private var chosenLimitValuePercentageView: some View {
            ZStack {
                Text("\(Int(chosenLimitValue))%")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .frame(width: 100, height: 40)
                    .background(Color.clear)
                
                Rectangle()
                    .frame(width: 3, height: 12)
                    .offset(x: -4, y: -20)
                    .foregroundStyle(.linearGradient(
                        colors: [
                            .topGradient,
                            .bottomGradient
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                    )
            }
    }
    
    private var triangleView: some View {
        
        Image(systemName: "triangle.fill")
            .resizable()
            .foregroundStyle(.linearGradient(
                colors: [
                    .topGradient,
                    .bottomGradient
                ],
                startPoint: .top,
                endPoint: .bottom)
            )
            .frame(width: 24, height: 18)
    }
    
    private var fullChargedView: some View {
        ZStack {
            Text("100%")
                .foregroundColor(.white)
            
            Rectangle()
                .frame(width: 3, height: 12)
                .offset(x: -4, y: -20)
                .foregroundStyle(.linearGradient(
                    colors: [
                        .topGradient,
                        .bottomGradient
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
        }
        .opacity(chosenLimitValue > 93.0 ? 0 : 1)
        .animation(.linear(duration: 0.5), value: chosenLimitValue)
        .offset(x: 150, y: -30)
    }
    
}


