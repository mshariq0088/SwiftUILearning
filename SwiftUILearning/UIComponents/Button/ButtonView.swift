//
//  ButtonView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/05/25.
//

import SwiftUI

struct ButtonView: View {
    
    @State var title = "This is my title"
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
            
            //Default System Button
            Button("Button 1") {
                self.title = "Button #1 Was Pressed"
            }
            .accentColor(Color.red)
            
            //Custom Button to add modifiers
            Button {
                self.title = "Button #2 Was Pressed"
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    )
            }
            
            //Add Circle Button
            Button {
                self.title = "Heart Button Was Pressed"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                    }
            }
            
            //Add Capsule Button
            Button {
                self.title = "Button #4 Was Pressed"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .shadow(radius: 10)
                    .background(
                        Capsule()
                            .stroke(Color.brown, lineWidth: 2.0)
                    )
            }


        }
    }
}

#Preview {
    ButtonView()
}
