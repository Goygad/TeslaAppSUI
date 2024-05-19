//
//  CustomTabViewShape.swift
//  TeslaApp
//
//  Created by Balik on 18.05.2024.
//

import SwiftUI

struct CustomTabViewShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        
        // Левая нижняя точка
        path.move(to: CGPoint(x: rect.minX + 20, y: rect.maxY))

        
        // Левая средняя точка
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.midY + 5), control: CGPoint(x: rect.minX + 5, y: height - 15))
        
        // Левая точка северо-запад
        path.addQuadCurve(to: CGPoint(x: rect.minX + 40, y: rect.minY + 8), control: CGPoint(x: rect.minX - 10, y: rect.minY + 30))
        
        // Левая точка север
        path.addQuadCurve(to: CGPoint(x: rect.midX - 47, y: rect.minY + 10), control: CGPoint(x: rect.midX - 60, y: rect.minY  - -5))
        
        // Правая точка север + радиус дуги
        path.addQuadCurve(to: CGPoint(x: rect.midX + 47, y: rect.minY + 10), control: CGPoint(x: rect.midX, y: rect.minY + 50))
        
        // Правая точка северо-восток
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 40, y: rect.minY + 8), control: CGPoint(x: rect.midX + 60, y: rect.minY - -5))
        
        // Правая средняя точка
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY + 5), control: CGPoint(x: rect.maxX + 10, y: rect.minY + 30))
        
        // Правая нижняя точка
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 30, y: rect.maxY), control: CGPoint(x: rect.maxX - 5, y: rect.maxY - 15))
        

        return path
    }
}


struct Show: View {
    var body: some View {
        CustomTabViewShape()
            .frame(height: 100)
    }
}

#Preview {
    Show()
}
