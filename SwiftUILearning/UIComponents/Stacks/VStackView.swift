//
//  VStackView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/05/25.
//

import SwiftUI

struct VStackView: View {
    var body: some View {
        Text("VStack View")
            .font(.largeTitle)
            .underline(true)
        VStack(alignment: .center, spacing: 8) { // Vertical
            Rectangle()
                .fill(Color.orange)
                .frame(width: 200, height: 200)
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    VStackView()
}
