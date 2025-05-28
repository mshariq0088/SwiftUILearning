//
//  AnimationTiming.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 28/05/25.
//

import SwiftUI

struct AnimationViewWithTiming: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 10.0
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Aminate Button") {
                isAnimating.toggle()
//                withAnimation(.linear(duration: timing)) {
//                    isAnimating.toggle()
//                }
            }
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.yellow)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(Animation.linear(duration: timing))
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.orange)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(Animation.easeIn(duration: timing))
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(Animation.easeInOut(duration: timing))
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(Animation.easeOut(duration: timing))
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.purple)
                .frame(width: isAnimating ? 350 : 50,height: 100)
                .animation(Animation.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1.0))
        }
    }
}

#Preview {
    AnimationViewWithTiming()
}
