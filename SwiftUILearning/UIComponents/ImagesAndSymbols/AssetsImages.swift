//
//  AssetsImages.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/05/25.
//

import SwiftUI

struct AssetsImages: View {
    var body: some View {
        Text("Assets-Images")
            .font(.title)
        
        Image("banana")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 200)
            //.clipped()
            //.cornerRadius(100)
            .clipShape(
                Circle()
                //Ellipse()
                //RoundedRectangle(cornerRadius: 20)
            )
        
        Image("apple")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .cornerRadius(50)
        
        Image("apple 1")
            .renderingMode(.template)
            .resizable()
            .foregroundStyle(.green.opacity(0.5))
            .frame(width: 200, height: 200)
//            .clipShape(
//                Ellipse()
//            )
        
        Image("patati")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(
                Circle()
            )
            
    }
}

#Preview {
    AssetsImages()
        .preferredColorScheme(.dark)
}
