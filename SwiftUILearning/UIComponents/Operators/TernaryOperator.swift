//
//  TernaryOperator.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/05/25.
//

import SwiftUI

struct TernaryOperator: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: isStartingState ? 20 : 10)
                .fill(isStartingState ? Color.green : Color.red)
                .frame(
                    width: isStartingState ? 200 : 50,
                    height: isStartingState ? 400 : 50
                )
            
            Text(isStartingState ? "Green Color" : "Red Color")
                .font(.largeTitle)
        }
    }
}

#Preview {
    TernaryOperator()
}
