//
//  BackgroundAndOverlays.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/05/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        //        Background
        Text("Hello,Shariq")
            .font(.system(size: 30, weight: .regular, design: .rounded))
            .multilineTextAlignment(.center)
            .background(
                //Color.red
                //                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                //                    startPoint: .leading,
                //                    endPoint: .trailing)
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),
                        startPoint: .leading,
                        endPoint: .trailing))
                    .frame(width: 200, height: 200, alignment: .center)
            )
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]),
                        startPoint: .leading,
                        endPoint: .trailing))
                    .frame(width: 230, height: 230, alignment: .center)
            )
    }
}

#Preview {
    BackgroundView()
        .preferredColorScheme(.light)
}
