//
//  ScrollView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 22/05/25.
//

import SwiftUI

struct VerticalScrollView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink, .yellow, .mint, .indigo, .cyan]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<colors.count) { index in
                    Rectangle()
                        .fill(colors[index])
                        .frame(width: 350, height: 200)
                        .cornerRadius(20)
                        .overlay(Text("Index: \(index)").foregroundColor(.white))
                }
            }
            .padding()
        }
    }
}

#Preview {
    VerticalScrollView()
}
