//
//  ColorPicker.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/06/25.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            ColorPicker("Select a Color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
            .padding()
            .background(Color.black)
            .cornerRadius(20)
            .foregroundStyle(.white)
            .font(.headline)
            .padding(50)
            
        }
    }
}

#Preview {
    ColorPickerView()
}
