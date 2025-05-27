//
//  AnimationView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/05/25.
//

import SwiftUI

struct AnimationView: View {
    @State var isAnimatrd: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Change Color and Animate") {
                withAnimation(.default) {
                    isAnimatrd.toggle()
                }
            }
            
            RoundedRectangle(cornerRadius: isAnimatrd ? 50 : 25)
                .fill(isAnimatrd ? Color.green : Color.red)
                .frame(
                    width: isAnimatrd ? 100 : 300,
                    height: isAnimatrd ? 100 : 300
                )
                .rotationEffect(.degrees(isAnimatrd ? 360 : 0))
                .offset(y: isAnimatrd ? 300 : 0)
                
        }
    }
}

#Preview {
    AnimationView()
}
