//
//  SafeAreaWithScrollView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/05/25.
//

import SwiftUI

struct SafeAreaWithScrollView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("List View")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 150)
                        .shadow(radius: 20)
                        .padding(20)
                }
            }
        }
        .background(
            Color.gray.opacity(0.4)
                //.edgesIgnoringSafeArea(.all)
                //.ignoresSafeArea()
        )
    }
}

#Preview {
    SafeAreaWithScrollView()
}
