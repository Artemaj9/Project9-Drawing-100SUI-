//
//  ContentView.swift
//  Project9-Drawing(100SUI)
//
//  Created by Artem on 15.08.2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
    
    struct Arc: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
            return path
        }
    }
    

struct ContentView: View {
    var body: some View {
        VStack {
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 50, height: 50)
            
            Circle()
                .stroke(.blue, lineWidth: 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
