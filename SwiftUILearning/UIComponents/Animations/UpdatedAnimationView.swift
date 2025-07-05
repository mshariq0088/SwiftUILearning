//
//  UpdatedAnimationView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct UpdatedAnimationView: View {
    
    @State private var animate1: Bool = false
    @State private var animate2: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Button("Button 1") {
                    animate1.toggle()
                }
                
                Button("Button 2") {
                    animate2.toggle()
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: animate1 ? .leading : .trailing)
                        .background(.green)
                        .frame(maxHeight: .infinity, alignment: animate2 ? .top : .bottom)
                        .background(.yellow)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.orange)
            }
        }
        .animation(.spring(), value: animate1)
        .animation(.linear(duration: 5), value: animate2)
    }
}

#Preview {
    UpdatedAnimationView()
}
