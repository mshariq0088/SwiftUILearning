//
//  MagnificationGestureBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/08/25.
//

import SwiftUI

struct MagnificationGestureBootCamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Swift UI Learning")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
           // Rectangle
            Image("ipad")
                .resizable()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is my new iPad")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
        
        
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .padding(40)
//            .background(Color.yellow.cornerRadius(20))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationGestureBootCamp()
}
