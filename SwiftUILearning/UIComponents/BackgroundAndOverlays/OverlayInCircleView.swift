//
//  OverlaysView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/05/25.
//

import SwiftUI

struct OverlayInCircleView: View {
    var body: some View {
        Circle()
            .fill(Color.pink)
            .frame(width: 200, height: 200)
            .overlay(
                Text("Shariq")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            )
        
            .background(
                Circle()
                    .fill(Color.purple)
                    .frame(width: 220, height: 220)
            )
        
    }
}

#Preview {
    OverlayInCircleView()
}
