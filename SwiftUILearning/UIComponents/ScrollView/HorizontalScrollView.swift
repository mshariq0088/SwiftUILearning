//
//  HorizontalScrollView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 22/05/25.
//

import SwiftUI

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.yellow.opacity(0.6))
                        .cornerRadius(20)
                        .frame(width: 200, height: 200)
                        .overlay(
                            Image("patati")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(
                                    Circle()
                                )
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    HorizontalScrollView()
}
