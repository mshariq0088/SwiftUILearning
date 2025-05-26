//
//  ExtractSubView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 26/05/25.
//

import SwiftUI

struct ExtractSubView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
                .ignoresSafeArea()
          contentView
        }
    }
    
    var contentView: some View {
        HStack {
            MyItem(title: "Apples", count: 10, color: .red)
            MyItem(title: "Oranges", count: 20, color: .orange)
            MyItem(title: "Bananas", count: 30, color: .yellow)
        }
    }
}

#Preview {
    ExtractSubView()
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
