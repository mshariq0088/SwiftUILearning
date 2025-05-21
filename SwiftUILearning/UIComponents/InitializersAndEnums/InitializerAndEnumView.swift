//
//  InitializerView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 21/05/25.
//

import SwiftUI

struct InitializerAndEnumView: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruits) {
        self.count = count
    
        if fruit == .apple {
            self.title = "Apple"
            self.backgroundColor = .red
        } else {
            self.title = "Grapes"
            self.backgroundColor = .green
        }
    }
    
    enum Fruits {
        case apple
        case grapes
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
                .underline()
            
            Text(title)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .foregroundStyle(Color.white)
            
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    HStack(spacing: 10) {
        InitializerAndEnumView(count: 100, fruit: .apple)
        InitializerAndEnumView(count: 200, fruit: .grapes)

    }
    .padding()
    
}
