//
//  UIColors_ColorsLiterals_HexColors.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 13/05/25.
//

import SwiftUI

struct UIColors_ColorsLiterals_HexColors: View {
    var body: some View {
        Text("UIColors-ColorsLiterals-HexColors")
            .font(.system(size: 40))
            .multilineTextAlignment(.center)
            .padding(.bottom)
        RoundedRectangle(cornerRadius: 20)
            .fill(
                //Color.blue
                //Color(UIColor.brown)
                //Color("CustomColor")
                Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)).opacity(0.8)
                
                
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 20)
            .shadow(color: .yellow.opacity(0.9), radius: 10, x: 10, y: -20)
    }
}

#Preview {
    UIColors_ColorsLiterals_HexColors()
        .preferredColorScheme(.dark)
}
