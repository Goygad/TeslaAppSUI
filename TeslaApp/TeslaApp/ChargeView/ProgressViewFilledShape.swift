//
//  ProgressViewFilledShape.swift
//  TeslaApp
//
//  Created by Balik on 19.05.2024.
//

import SwiftUI

struct ProgressViewFilledShape: Shape {
    var progress: Double

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width * CGFloat(progress / 100)
        let height = rect.height

        // Начальная точка
        path.move(to: CGPoint(x: 0, y: height))
        
        // Движение вверх на половину
        path.addLine(to: CGPoint(x: 0, y: height / 2))
        
        // движение вверх и на право
        path.addLine(to: CGPoint(x: 10, y: 0))

        // на право
        path.addLine(to: CGPoint(x: width - 10, y: 0))

        // на право и вниз
        path.addLine(to: CGPoint(x: width, y: height / 2))

        // вниз
        path.addLine(to: CGPoint(x: width, y: height))

        // назад
        path.closeSubpath()
        return path
    }
}

