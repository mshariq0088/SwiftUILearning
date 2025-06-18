//
//  SliderView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/06/25.
//

import SwiftUI

struct SliderView: View {
    
    @State var sliderValue: Double = 0
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)).ignoresSafeArea()
            
            VStack {
                Text("Rating: ")
                    .font(.title)
                    .foregroundStyle(.white)
                Text(String(format: "%.0f", sliderValue))
                    .font(.title)
                    .foregroundStyle(.white)
                
                //Slider(value: $sliderValue)
                //Slider(value: $sliderValue, in: 1...100)
                Slider(
                    value: $sliderValue,
                    in: 1...100,
                    step: 1.0,
                    onEditingChanged: { (_) in
                        
                    },
                    minimumValueLabel: Text("1").font(.headline).foregroundStyle(.white),
                    maximumValueLabel: Text("100").font(.headline).foregroundStyle(.white),
                    label: {
                        Text("Title")
                    })
                .accentColor(.red)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SliderView()
}
