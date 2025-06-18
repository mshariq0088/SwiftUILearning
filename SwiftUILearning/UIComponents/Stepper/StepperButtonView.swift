//
//  StepperButtonView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/06/25.
//

import SwiftUI

struct StepperButtonView: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper") {
                incrementWidth(amount: 10)
            } onDecrement: {
                incrementWidth(amount: -10)
            }
            .padding(.horizontal)
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.linear) {
            widthIncrement += amount
        }
    }
}

#Preview {
    StepperButtonView()
}
