//
//  ShapesView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/05/25.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        Circle()
            .fill(.yellow)
//            .foregroundColor(.green)
            .stroke(Color.red, lineWidth: 10)
            //.stroke(Color.green, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [20]))
            //.trim(from: 0.1, to: 0.9)
            .frame(width: 300, height: 300)
        
        Ellipse()
            .fill(.link)
            //.foregroundStyle(Color.green)
            .stroke(Color.gray, lineWidth: 10)
            .frame(width: 300, height: 100)
        Capsule()
            .fill(.brown)
            .stroke(Color.black, lineWidth: 10)
            .frame(width: 300, height: 100)
        
        Rectangle()
            .fill(.gray)
            .stroke(Color.yellow, lineWidth: 10)
            .frame(width: 300, height: 100)
        
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.mint)
            .stroke(Color.gray, lineWidth: 10)
            .frame(width: 360, height: 100)
    }
}

#Preview {
    ShapesView()
}
