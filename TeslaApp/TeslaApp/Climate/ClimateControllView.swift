//
//  ClimateControllView.swift
//  TeslaApp
//
//  Created by Balik on 15.05.2024.
//

import SwiftUI

struct ClimateView: View {
    // MARK: - Constants
    enum Constants {
        static let climateLabel = "CLIMATE"
    }
    
    @State var startColor = Color.topGradient
    @State var endColor = Color.red
    
    var body: some View {
        backgroungStackView {
            ZStack {
                    VStack {
                        headerStack
                        Spacer()
                            .frame(height: 80)
                        coloredIndicatorView
                        Spacer()
                            .frame(height: 60)
                        
                        withAnimation {
                            
                                slidersView
                            
                        }
                    }
                  
                    .frame(height: UIScreen.main.bounds.height)
                    bottomSheetView
                        .frame(height: UIScreen.main.bounds.height + 250)
                        .background(RoundedRectangle(cornerRadius: 40).fill(.lockButtonGradientBottom))
                        .opacity(0.8)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .offset(y: UIScreen.main.bounds.height)
                        .offset(y: currentSettingsOffsetY)
                        .gesture(dragGesture)
                if isTappedGearButton {
                    alertView
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .zIndex(1)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    @Environment(\.dismiss) private var dismiss
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentSettingsOffsetY: CGFloat = 0.0
    @State private var lastSettingsOffsetY: CGFloat = 0.0
    @State private var isTappedGearButton = false
    @State private var acOffset = 0.0
    @State private var fanOffset = 0.0
    @State private var heatOffset = 0.0
    @State private var autoOffset = 0.0
    @State private var sliderValue = 15
    @State private var acValue: Double = 15.0
    @State private var fanValue: Double = 0.0
    @State private var heatValue: Double = 0.0
    @State private var autoValue: Double = 0.0
    @State private var isExpanded = true
    @State private var isACOn: Bool = false
    @State private var increasingColor = Color.topGradient
    
    
    private var headerStack: some View {
        HStack{
            Button {
                dismiss()
            } label: {
                Image(.backButton)
                    .circleButtonImageModifierStyle()
            }
            .circleButtonModifierStyle()
            Spacer()
            Text(Constants.climateLabel)
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Button {
                isTappedGearButton.toggle()
            } label: {
                Image(.gear)
                    .circleButtonImageModifierStyle()
            }
            .circleButtonModifierStyle()
        }
        .padding(.horizontal, 30)
    }
    
    private var coloredIndicatorView: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat((acValue - 15) / 15))
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round))
                .foregroundColor(acValue < 25 ? startColor : endColor)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 192, height: 192)
                .zIndex(1)
                .opacity(isACOn ? 1 : 0)
                .animation(.linear)
                .shadow(color: acValue < 25 ? startColor : endColor, radius: 10, x: 0, y: 0)
            Circle()
                .fill(climateIndicatorGradient)
                .frame(width: 185, height: 185)
                .climateCircleIndicatorConfiguration()
            Circle()
            
                .fill(
                    .darkShadow
                        .shadow(.inner(color: .circleButtonGradientTop.opacity(0.6), radius: 50, x: -80, y: -80))
                    
                )
                .overlay {
                                        Text("\(String(acValue.description.prefix(2)))° C")
                                            .font(.system(size: 30, weight: .bold))
                                            .opacity(isACOn ? 1 : 0)
                }
                .frame(width: 130, height: 130)
                .background(Circle().stroke(.climateIndicatorMiddle, lineWidth: 1))
                .circleButtonModifierStyle()
            
        }
    }
    
    private var bottomSheetView: some View {
        VStack {
            bottomSheetHeaderView
            controlButtonsView
            Spacer()
        }
    }
    
    private var slidersView: some View {
        return DisclosureGroup(isExpanded: $isExpanded) {
            VStack(spacing: 20) {
                acSliderView
                fanSliderView
                heatSliderView
                autoSliderView
            }
            
        } label: {
        }
        .padding(.horizontal)
        
    }
    
    private var acSliderView: some View {
        HStack {
            Text("A/C")
                .frame(width: 50)
            Spacer()
                .frame(width: 20)
            Button {
                
            } label: {
                Image(.ac)
                    .renderingMode(.template)
                    .foregroundColor(isACOn ? .topGradient : .textGray)
            }
            .climateCircleSettingStyle()
            
            Spacer()
            
            CustomSliderView(value: $acValue, minValue: 15, maxValue: 30, offset: $acOffset, colorOne: acValue > 24 ? $endColor : $startColor, colorTwo: $endColor)
            
                .frame(width: 190)
            Spacer()
                .frame(width: 20)
            
        }
        .disabled(!isACOn)
        .padding(.top, 10)
        .foregroundColor(.textGray)
    }
    
    private var fanSliderView: some View {
        HStack {
            Text("Fan")
                .frame(width: 50)
            Spacer()
                .frame(width: 20)
            Button {
                
            } label: {
                Image(.fan)
            }
            .climateCircleSettingStyle()
            
            
            Spacer()
            CustomSliderView(value: $fanValue, minValue: 15, maxValue: 30, offset: $fanOffset, colorOne: $increasingColor, colorTwo: $endColor)
                .frame(width: 190)
            Spacer()
                .frame(width: 20)
            
        }
        .foregroundColor(.textGray)
        .padding(.top, 10)
        .disabled(!isACOn)
        
    }
    
    private var heatSliderView: some View {
        HStack {
            Text("Heat")
                .frame(width: 50)
            Spacer()
                .frame(width: 20)
            Button {
                
            } label: {
                Image(.heat)
            }
            .climateCircleSettingStyle()
            
            
            Spacer()
            CustomSliderView(value: $heatValue, minValue: 15, maxValue: 30, offset: $heatOffset, colorOne: $increasingColor, colorTwo: $endColor)
                .frame(width: 190)
            Spacer()
                .frame(width: 20)
            
        }
        .foregroundColor(.textGray)
        .padding(.top, 10)
        .disabled(!isACOn)
        
    }
    
    private var autoSliderView: some View {
        HStack {
            Text("Auto")
                .frame(width: 50)
            Spacer()
                .frame(width: 20)
            Button {
            } label: {
                Image(.auto)
            }
            .climateCircleSettingStyle()
            
            Spacer()
            
            CustomSliderView(value: $autoValue, minValue: 15, maxValue: 30, offset: $autoOffset, colorOne: $increasingColor, colorTwo: $endColor)
                .frame(width: 190)
            Spacer()
                .frame(width: 20)
            
        }
        .foregroundColor(.textGray)
        .padding(.vertical, 10)
        .disabled(!isACOn)
        
    }
    
    private var bottomSheetHeaderView: some View {
        VStack {
            Capsule()
                .fill(.black)
                .frame(width: 80, height: 4)
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("A/C is \(isACOn ? "ON" : "OFF")")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("Tap to turn off or swipe up \nfor a fast setup")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button {
                    withAnimation {
                        isACOn.toggle()
                    }
                } label: {
                    Image(systemName: "power")
                        .frame(width: 60, height: 60)
                        .tint(.white)
                        .overlay {
                            Circle()
                                .stroke(.topGradient.opacity(0.6), lineWidth: 2)
                        }
                        .background(
                            Circle()
                                .fill(
                                    .topGradient
                                        .shadow(.inner(color: .blue, radius: 12, x: 15, y: 10))
                                        .shadow(.inner(color: .blue, radius: 10, x: -1, y: -5))
                                )
                            
                        )
                }
                .shadow(color: .darkShadow, radius: 6, x: 0, y: 0)
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
    
    private var controlButtonsView: some View {
        HStack(alignment: .top,spacing: 50) {
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 15)
                ColorPicker("", selection: acValue > 24 ? $endColor : $startColor)
                    .frame(width: 20)
                  
                Spacer()
                    .frame(height: 40)
                Text("On")
                    .font(.system(size: 20))
            }
            .frame(height: 90)
            HStack() {
                Button {
                    guard acValue > 15 else { return }
                    acValue -= 1
                    acOffset -= 11
                } label: {
                    Image(.leftArrow)
                }
                .disabled(!isACOn)
                
                Text("\(Int(acValue))°")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(width: 60)
                Button {
                    guard acValue < 30 else { return }
                    acValue += 1
                    acOffset += 11
                } label: {
                    Image(.rightArrow)
                }
                .disabled(!isACOn)
                
            }
            VStack() {
                Spacer()
                    .frame(height: 15)
                Button {
                } label: {
                    Image(.vent)
                }
                Spacer()
                    .frame(height: 40)
                Text("Vent")
            }
            .frame(height: 80)
        }
        .frame(height: 100)
        .padding()
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeSettingsOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height / 5
                
                withAnimation {
                    if -currentSettingsOffsetY > maxHeight / 2 {
                        currentSettingsOffsetY = -maxHeight
                    } else {
                        currentSettingsOffsetY = 0
                    }
                    lastSettingsOffsetY = currentSettingsOffsetY
                }
            }
    }
    
    private var climateIndicatorGradient: LinearGradient {
        LinearGradient(colors: [ .climateIndicatorGradientLight, .climateIndicatorGradientDark.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    private func onChangeSettingsOffset() {
        DispatchQueue.main.async {
            self.currentSettingsOffsetY = gestureOffset.height +                    lastSettingsOffsetY
        }
    }
    
    private func onChangeColor() {
        if acValue > 24 {
            increasingColor = endColor
        }
    }
    
    var alertView: some View {
        VStack(spacing: 15) {
            Text("Tesla Support")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            ControlGroup {
                if let url = URL(string: "https://www.tesla.com/support") {
                    Link(destination: url, label: {
                        Text("Open website")
                    })
                    .foregroundColor(.topGradient)
            }
                Button("Cancel") {
                    
                        isTappedGearButton.toggle()
                    
                }
                .foregroundStyle(.textGray)
            }
            .frame(width: 200, height: 30)
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(.climateIndicatorGradientLight))
        .shadow(radius: 10)
    }
    
}


#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}
