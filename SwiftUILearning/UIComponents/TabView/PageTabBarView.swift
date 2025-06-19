//
//  PageTabBarView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/06/25.
//

import SwiftUI

struct PageTabBarView: View {
    
    let icons: [String] = [
        "house.fill", "globe", "heart.fill", "person.fill", "cart.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}

#Preview {
    PageTabBarView()
}
