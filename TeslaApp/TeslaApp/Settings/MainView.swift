//
//  ContentView.swift
//  TeslaApp
//
//  Created by Balik on 13.05.2024.
//

import SwiftUI

struct MainView: View {
    // MARK: - Constants
   private enum Constants {
        static let headerTitle = "Tesla"
        static let kilometers = "187"
       static let lockedText = "Lock"
       static let unlockedText = "Unlock"
    }
    
    var body: some View {
        backgroungStackView {
            VStack {
                Spacer()
                    .frame(height:50)
                headerView
                imageView
                controllPanelView
                navigationView
                Spacer()
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @Environment(\.dismiss) private var dismiss

    
    @State private var tagSelected = 0
    @State private var shouldNavigateToLockView = false
    @State private var shouldNavigateToClimateView = false
    @State private var shouldNavigateToEnergyView = false
    @State private var shoulNavigateToCharacteristicsView = false

    private var gradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.headerTitle)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
                Text(Constants.kilometers)
                    .font(.system(size: 17, weight: .semibold))
                    .opacity(0.4)
            }
            Spacer()
            
                Button {
                } label: {
                    Image(.profile)
                        .circleButtonImageModifierStyle()
                }
                .circleButtonModifierStyle()
        }
        .padding(.all, 30)
    }
    
    private var imageView: some View {
        Image(.carRightSide)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .padding(.horizontal)
            .shadow(color: .white.opacity(0.6),  radius: 15, x: 10, y: 10)
            
    }
    
    private var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                        navigateToViews()
                    }
                } label: {
                    Image("\(index)")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .overlay {
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .shadow(color: .white, radius: 7)
                                .opacity(tagSelected == index ? 1 : 0)
                                .padding(-8)
                        }
                }
                .padding(10)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius:50).fill(Color(.backgroundMain)))
        
        .neumorphismUnSelectedStyle()
    }
    
    private func navigateToViews() {
        switch tagSelected {
            case 1:
                dismiss()
        case 2:
            shouldNavigateToClimateView.toggle()
        case 3:
            shouldNavigateToEnergyView.toggle()
        case 4:
            shoulNavigateToCharacteristicsView.toggle()
        default:
            break
        }
    }
    
    private var navigationView: some View {
        VStack {
            NavigationLink(
                destination: ClimateView(),
                isActive: $shouldNavigateToClimateView,
                label: {})
            NavigationLink(
                destination: Text("energy view"),
                isActive: $shouldNavigateToEnergyView,
                label: {})
            NavigationLink(
                destination: Text("characteristics"),
                isActive: $shoulNavigateToCharacteristicsView,
                label: {})
        }
    }
    
    
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
