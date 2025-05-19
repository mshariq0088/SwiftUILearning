//
//  PaddingWithVStack.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/05/25.
//

import SwiftUI

struct PaddingWithVStack: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            Text("This is the description of what we will do on the screen. It is multiples lines and we will align the text to the leading edge.")
    
        }
        .padding()
        .background(
            Color.white
                .cornerRadius(20)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0, y: 10)
        )
        .padding(.horizontal, 10)
    }
}

#Preview {
    PaddingWithVStack()
}
