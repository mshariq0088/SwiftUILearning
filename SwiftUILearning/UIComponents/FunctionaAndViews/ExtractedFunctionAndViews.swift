//
//  ExtractedFunction.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 25/05/25.
//

import SwiftUI

struct ExtractedFunctionAndViews: View {
    
    @State var backgroundColor: Color = Color.pink
    @State var title: String = "Hello Shariq"
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea()
            
            //Content Layer
            contentView
        }
    }
    
    //Content View
    var contentView: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .underline()
            Button {
                buttonPressed()
            } label: {
                Text("Tap Me")
                    .font(.headline)
                    .foregroundStyle(Color.black)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(20)
            }
        }
    }
    
    //Button Action function
    func buttonPressed() {
        backgroundColor = Color.yellow
        title = "Good Bye Shariq"
        
    }
}

#Preview {
    ExtractedFunctionAndViews()
}
