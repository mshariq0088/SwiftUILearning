//
//  Linear_Radical_Angular_Gradients.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 13/05/25.
//

import SwiftUI

struct Linear_Radical_Angular_Gradients: View {
    var body: some View {
        Text("Linear-Radical-Angular-Gradients")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .multilineTextAlignment(.center)
            .minimumScaleFactor(1)
            .padding()
        Text("1")
            .font(.title2)
        
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.green]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 300, height: 200)
        
        Text("2")
            .font(.title2)
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                RadialGradient(gradient: Gradient(colors: [Color.orange, Color.blue]),
                               center: .center,
                               startRadius: 20,
                               endRadius: 100)
            )
            .frame(width: 300, height: 200)
        
        Text("3")
            .font(.title2)
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                AngularGradient(gradient: Gradient(colors: [Color.red, Color.black]),
                                center: .center, // .topLeading, .topTrailing
                                angle: .degrees(180 + 45))
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    Linear_Radical_Angular_Gradients()
        .preferredColorScheme(.light)
}
