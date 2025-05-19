//
//  OverlayUseInNotificationBedgeView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/05/25.
//

import SwiftUI

struct OverlayUseInNotificationBedgeView: View {
    var body: some View {
        Image(systemName: "bell.fill")
            .font(.system(size: 40))
            .foregroundStyle(Color.white)
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.4772609685)) , radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.red)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundStyle(Color.white)
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.5186775662)) , radius: 10, x: 0.0, y: 10)
                        , alignment: .bottomTrailing)
            )
    }
}

#Preview {
    OverlayUseInNotificationBedgeView()
        .preferredColorScheme(.light)
}
