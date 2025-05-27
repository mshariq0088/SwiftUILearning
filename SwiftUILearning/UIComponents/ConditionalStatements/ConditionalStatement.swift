//
//  ConditionalStatement.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/05/25.
//

import SwiftUI

struct ConditionalStatement: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            
            if showCircle {
                Circle()
                    .frame(width: 200, height: 200)
            }
            
            if showRectangle {
                Rectangle()
                    .frame(width: 200, height: 200)
            }
            
//            if showCircle && showRectangle {
//                    RoundedRectangle(cornerRadius: 20)
//                        .frame(width: 200, height: 200)
//            }
            if showCircle || showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 100)
            }
        }
    }
}

#Preview {
    ConditionalStatement()
}
