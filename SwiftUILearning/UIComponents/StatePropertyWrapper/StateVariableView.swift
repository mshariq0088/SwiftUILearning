//
//  StateVariableView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 25/05/25.
//

import SwiftUI

struct StateVariableView: View {
    
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My Background Color"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                
                Text("Count: \(count)")
                    .font(.caption)
                
                HStack(spacing: 20) {
                    Button("Red Button") {
                        backgroundColor = .red
                        myTitle = "My Background Color is Red"
                        count += 1
                    }
                    
                    Button("Purple Button") {
                        backgroundColor = .purple
                        myTitle = "My Background Color is Purple"
                        count -= 1
                    }
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    StateVariableView()
}
