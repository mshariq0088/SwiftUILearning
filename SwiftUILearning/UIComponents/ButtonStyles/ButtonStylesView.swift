//
//  ButtonStylesView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

/*
 buttonStyle
 buttonControlSize
 buttonBorderShape
 */

import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
        }
        .padding()
    }
}

#Preview {
    ButtonStylesView()
}
