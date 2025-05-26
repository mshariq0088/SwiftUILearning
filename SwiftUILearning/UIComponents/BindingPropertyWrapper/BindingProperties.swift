//
//  BindingProperties.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 26/05/25.
//

import SwiftUI

struct BindingProperties: View {
    
    @State var backgroundColor: Color = Color.blue
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundStyle(Color.white)
                    .font(.largeTitle)
                ButtonActionView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonActionView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = Color.yellow
            title = "This is Yellow Background"
        } label: {
            Text("Change Color")
                .foregroundStyle(Color.white)
                .padding()
                .padding(.horizontal)
                .background(Color.black)
                .cornerRadius(20)
        }
    }
}

#Preview {
    BindingProperties()
}
