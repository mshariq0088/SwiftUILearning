//
//  FrameView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/05/25.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        Text("Frame BootCamp")
            .font(.title)
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .background(Color.red)
            .frame(height: 150)
            .background(Color.blue)
            .frame(width: 200)
            .background(Color.orange)
            .frame(maxWidth: .infinity)
            .background(Color.purple)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity)
            .background(Color.yellow)
    }
}

#Preview {
    FrameView()
}
