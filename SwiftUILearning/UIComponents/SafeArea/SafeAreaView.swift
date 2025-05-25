//
//  SafeAreaView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/05/25.
//

import SwiftUI

struct SafeAreaView: View {
    var body: some View {
        ZStack {
            //Background
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            //Foreground
            VStack {
                Text("Hello SwiftUI Learner")
                    .font(.largeTitle)
                    .underline()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.background(Color.red)
        }
    }
}

#Preview {
    SafeAreaView()
}
