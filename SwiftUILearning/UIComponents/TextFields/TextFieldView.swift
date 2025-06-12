//
//  TextFieldView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/06/25.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var textField: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textField)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(20)
                    .foregroundStyle(Color.black)
                    .font(.headline)
                
                Button(action: {
                    if textIsAppropriate() {
                        saveText()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(width: 200)
                        .background(textIsAppropriate() ? Color.blue : Color.red)
                        .cornerRadius(20)
                        .foregroundStyle(Color.white)
                        .font(.headline)
                })
                .disabled(!textIsAppropriate())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("TextField BootCamp")
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textField.count >= 3 {
            return true
        } else {
            return false
        }
    }
    
    func saveText() {
        dataArray.append(textField)
        textField = ""
    }
}

#Preview {
    TextFieldView()
}
