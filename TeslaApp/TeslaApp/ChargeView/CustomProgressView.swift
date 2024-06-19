//
//  CustomProgressView.swift
//  TeslaApp
//
//  Created by Balik on 19.05.2024.
//

import SwiftUI

struct CustomProgressView: View {
    @Binding var progress: Double

    var body: some View {
        ZStack(alignment: .leading) {
            ProgressViewShape()
                .fill(.linearGradient(
                    colors: [
                        .chargBackgroundTop,
                        .black.opacity(0.2),
                        .chargBackgroundBottom.opacity(1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
                .overlay {
                    ProgressViewShape()
                        .stroke(.textGray, lineWidth: 0.3)
                }
                .frame(width: 300, height: 50)
//                .shadow(color: .textGray, radius: 5, x: 0, y: 0)

            ProgressViewFilledShape(progress: progress)
                .fill(.linearGradient(
                    colors: [
                        .topGradient,
                        .bottomGradient
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
                .frame(width: CGFloat(progress) * 3, height: 50)
                .shadow(
                    color: .topGradient.opacity(0.3),
                    radius: 15, x: 0, y: -50)
                .shadow(color: .bottomGradient.opacity(0.8), radius: 10, x: 0, y: 0)
                .animation(.linear, value: progress)

            HStack {
                Text("\(Int(progress))")
                    .foregroundColor(.white)
                    .font(.system(size: 35))
                    .bold()
                
                Text("%")
                    .foregroundColor(.textGray)
                    .font(.system(size: 20))
            }
            .offset(x: 125, y: -65)
        }
    }
}

