//
//  RotationGestureBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/08/25.
//

import SwiftUI

struct RotationGestureBootCamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue)
            .cornerRadius(20)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureBootCamp()
}
