//
//  PaddingView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/05/25.
//

import SwiftUI

struct PaddingView: View {
    var body: some View {
        Text("Hello Mohammad Shariq Welcome to the SwiftUI World")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.cyan)
            .padding(.leading, 20)
    }
}

#Preview {
    PaddingView()
}
