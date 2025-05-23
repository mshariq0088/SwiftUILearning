//
//  LazyVGridView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/05/25.
//

import SwiftUI

struct LazyVGridView: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(50)),
        GridItem(.fixed(75)),
        GridItem(.fixed(100)),
        GridItem(.fixed(75)),
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.gray)
                        .cornerRadius(10)
                        .frame(height: 50)
                        
                }
            }
        }
       
    }
}

#Preview {
    LazyVGridView()
}
