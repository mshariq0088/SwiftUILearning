//
//  SpacerView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/05/25.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        Text("Spacer")
            .font(.largeTitle)
            .underline()
        
        HStack(spacing: 0) {
            
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(Color.black)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
            
            Spacer()
                .frame(height: 10)
                .background(Color.black)
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            Spacer()
                .frame(height: 10)
                .background(Color.black)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
            
            Spacer()
                .frame(height: 10)
                .background(Color.black)
        }
        
    }
}

#Preview {
    SpacerView()
}
