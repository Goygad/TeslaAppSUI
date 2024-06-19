//
//  ChargeView.swift
//  TeslaApp
//
//  Created by Balik on 19.05.2024.
//

import SwiftUI

struct ChargeView: View {
    // MARK: - Constants
    enum Constants {
        static let titleNavBar = "Charging"
        static let chargeLimit = "Set Charge Limit"
    }
    
        @State private var isSettingsTapped = false
        @State private var isExpanded = false
        @State private var firstOpacity: Double = 0
        @State private var secondOpacity: Double = 0
        @State private var progressValue: Double = 75
        @State private var chargeLimit: Double = 50.0
    
    var body: some View {
        
        backgroungStackView {
        ZStack {

                VStack(spacing: -9) {
                    Spacer()
                        .frame(height: 90)
                    headerStack
                    carImageView
                    
                    VStack {
                        CustomProgressView(progress: $chargeLimit)
                        Spacer()
                            .frame(height: 45)
                        VStack() {
                            CustomChargingSlider(chosenLimitValue: $chargeLimit)
                                .frame(width: 300)
                            
                            Text(Constants.chargeLimit)
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.textGray)
                            
                        }
                        .frame(height: 50)
                    }
                    Spacer()
                        .frame(height: 40)
 
                    superchargersDropListView
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.height)

            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerStack: some View {
        HStack{
            Button {
               
            } label: {
                Image(.backButton)
                    .circleButtonImageModifierStyle()
            }
            .circleButtonModifierStyle()
            Spacer()
            Text(Constants.titleNavBar)
                .font(.system(size: 20, weight: .semibold))
            Spacer()
            Button {
                isSettingsTapped.toggle()
            } label: {
                Image(.gear)
                    .circleButtonImageModifierStyle()
            }
            .circleButtonModifierStyle()
        }
        .padding(.horizontal, 30)
    }
    
    private var carImageView: some View {
        Image("chargingCar")
            .shadow(color: .climateIndicatorGradientDark, radius: 10, x: 0, y: 0)
    }
    
    private var superchargersDropListView: some View {
        RoundedRectangle(cornerRadius: 45)
            .fill(
                .dropMenu.opacity(0.5)
                .shadow(.inner(color: .black.opacity(0.8), radius: 7, x: 5, y: 5))
                    .shadow(.inner(color: .dropMenuButtonGradientTop.opacity(1), radius: 10, x: -5, y: -5))
            )
            .frame(width: 330, height: isExpanded ? 370 : 150)
            .animation(.easeInOut(duration: 0.7), value: isExpanded)
            .overlay {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 45)
                    HStack() {
                        Text("Nearby Superchargers")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                        Button {
                            withAnimation {
                                isExpanded.toggle()
                                animateChargingStationsView()
                            }
                        } label: {
                            Image(isExpanded ? "expanded" : "collapsed")
                                .renderingMode(.template)
                                .tint(.white)
                                .frame(width: 13, height: 22)
                                .scaledToFit()
                                .dropMenuCircleButtonStyle()
                                .overlay {
                                    Circle()
                                        .stroke(.dropMenuButtonGradientBottom.opacity(0.5), lineWidth: 2)
                                }
                            Spacer()
                                .frame(width: 10)
                        }
                    }
                    Spacer()
                    VStack {
                        if isExpanded {
                            superchargersStationsView
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
    }
    
    private func animateChargingStationsView() {
        if isExpanded {
            withAnimation(.easeIn(duration: 0.5)) {
                firstOpacity = 1
            }
            withAnimation(.easeIn(duration: 0.5).delay(0.5)) {
                secondOpacity = 1
            }
        } else {
            withAnimation(.linear(duration: 0.1)) {
                secondOpacity = 0
                
            }
            withAnimation(.linear(duration: 0.1)) {
                firstOpacity = 0
            }
        }

    }
    
    private var backgroundGradient: LinearGradient {
        LinearGradient(colors: [.lockButtonGradientBottom, .unlockedGradientTop, .unlockedGradientBottom], startPoint: .top, endPoint: .bottom)
    }
    
    private var superchargersStationsView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Tesla Supercharger - \nSaint-Peterburg")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.semibold)
                    Text("4")
                        .foregroundColor(.white)
                    +
                    Text(" / 12 available")
                        .foregroundColor(.gray)
                }
                Spacer()

                VStack(alignment: .center) {
                    Image("mapPoint")
                    Text("0.3 km")
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(width: 70)

            }
            .opacity(firstOpacity)
            Spacer()
                .frame(height: 40)
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Tesla Supercharger - \nSaint-Peterburg")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.semibold)
                    Text("39")
                        .foregroundColor(.white)
                    +
                    Text(" / 56 available")
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .center) {
                    Image("mapPoint")
                    Text("1.2 km")
                        .foregroundColor(.white.opacity(0.7))
                }
                .frame(width: 70)
            }
            .opacity(secondOpacity)
            Spacer()
                .frame(height: 0)

        }
    }
}


#Preview {
    ChargeView()
}


