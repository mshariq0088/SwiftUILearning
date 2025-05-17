//
//  OverlayInRectangleView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/05/25.
//

import SwiftUI

struct OverlayInRectangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .overlay(
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                , alignment: .center
            )
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
                , alignment: .center
            )
    }
}

#Preview {
    OverlayInRectangleView()
}
