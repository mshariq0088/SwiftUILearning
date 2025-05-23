//
//  ForEachLoopView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 22/05/25.
//

import SwiftUI

struct ForEachLoopView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink, .yellow, .mint, .indigo, .cyan]
    
    var body: some View {
        VStack {
            ForEach(0..<colors.count) { index in
                HStack {
                    Circle()
                        .fill(colors[index])
                        //.fill(colorForIndex(index))
                        .frame(width: 50, height: 50)
                    Text("Circle: \(index)")
                        .font(.title2)
                }
            }
        }
    }
    
//    func colorForIndex(_ index: Int) -> Color {
//        switch index % 3 {
//        case 0:
//            return .blue
//        case 1:
//            return .black
//        case 2:
//            return .green
//        default:
//            return .gray
//        }
//    }
}

#Preview {
    ForEachLoopView()
}
