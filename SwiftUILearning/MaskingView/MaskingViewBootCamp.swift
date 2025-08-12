//
//  MaskingViewBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 11/08/25.
//

import SwiftUI

struct MaskingViewBootCamp: View {
    
    @State private var rating: Int = 0
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            starView
                .overlay(overlayView.mask(starView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.pink]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundStyle(.gray)
                    .font(.largeTitle)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskingViewBootCamp()
}
