//
//  SubmitTextFieldView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 03/07/25.
//

import SwiftUI

struct SubmitTextFieldView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder Text", text: $text)
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(20)
                .submitLabel(.go)
                .onSubmit {
                    print("Text Field Submit")
                }
        }
        .padding(40)
    }
}

#Preview {
    SubmitTextFieldView()
}
