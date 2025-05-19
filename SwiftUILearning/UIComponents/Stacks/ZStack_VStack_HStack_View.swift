//
//  ZStack_VStack_HStack_View.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/05/25.
//

import SwiftUI

struct ZStack_VStack_HStack_View: View {
    var body: some View {
        Text("ZStack-VStack-HStack-View")
            .font(.largeTitle)
            .underline(true)
            .multilineTextAlignment(.center)
        
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 600, alignment: .center)
            
            VStack(alignment: .leading, spacing: 30) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 150)
                HStack(alignment: .bottom, spacing: 30) {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 75, height: 75)
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 50, height: 50)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                }
                .background(Color.cyan)
            }
            .background(Color.gray)
        }
        
    }
}

#Preview {
    ZStack_VStack_HStack_View()
}
