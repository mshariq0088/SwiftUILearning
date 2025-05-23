//
//  VerticalAndHorizontalScrollView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 23/05/25.
//

import SwiftUI

struct VerticalAndHorizontalScrollView: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink, .yellow, .mint, .indigo, .cyan]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<colors.count) { index in
                    ScrollView(.horizontal, showsIndicators: false, content:  {
                        HStack {
                            ForEach(0..<10) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(colors[index])
                                    .frame(width: 200, height: 200)
                                    .shadow(radius: 10)
                                    .overlay(
                                        Image("patati")
                                            .resizable()
                                            .frame(width: 100, height: 100, alignment: .center)
                                    )
                                    .padding()
                            }
                        }
                    })
                    
                }
            }
        }
    }
}

#Preview {
    VerticalAndHorizontalScrollView()
}
