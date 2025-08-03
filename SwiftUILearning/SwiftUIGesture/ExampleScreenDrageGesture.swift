//
//  ExampleScreenDrageGesture.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 03/08/25.
//

import SwiftUI

struct ExampleScreenDrageGesture: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring) {
                                currentOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring) {
                                if currentOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ExampleScreenDrageGesture()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("This is description for our app. This is my favroite app and i recommend to all of my friends to use this app.")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
