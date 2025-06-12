//
//  TextFieldEditerView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/06/25.
//

import SwiftUI

struct TextEditerView: View {
    
    @State var textEditerText: String = "Type something here"
    @State var saveText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditerText)
                    .frame(height: 250)
                    //.foregroundStyle(Color.black)
                    .colorMultiply(Color.gray.opacity(0.3))
                    .cornerRadius(20)
                
                Button(action: {
                    saveText = textEditerText
                    textEditerText = ""
                }, label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .cornerRadius(20)
                })
                Text(saveText)
                Spacer()
            }
            .padding()
            //.background(.yellow)
            .navigationTitle("Text Editer Bootcamp")
        }
    }
}

#Preview {
    TextEditerView()
}
