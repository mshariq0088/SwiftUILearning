//
//  SrcollViewReaderBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/08/25.
//

import SwiftUI

struct SrcollViewReaderBootCamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter Number here...", text: $textFieldText)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Click to navigate") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
//                withAnimation(.spring()) {
//                    proxy.scrollTo(17, anchor: .bottom)
//                }
            }

            
            ScrollView {
                ScrollViewReader { proxy in
                                        
                    ForEach(0..<20) { index in
                        Text("This is item no - \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SrcollViewReaderBootCamp()
}
