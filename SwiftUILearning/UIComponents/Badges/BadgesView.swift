//
//  BadgesView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//


/*
 ListView
 tabView
 */
import SwiftUI

struct BadgesView: View {
    var body: some View {
        TabView {
            Color.yellow
                .tabItem {
                    Image(systemName: "heart.fill")
                        Text("Heart")
                }
                .badge(2)
            
            Color.green
                .tabItem {
                    Image(systemName: "person.fill")
                        Text("Person")
                }
                .badge("request")

            Color.purple
                .tabItem {
                    Image(systemName: "cart.fill")
                        Text("Add to Cart")
                }
                .badge(4)

        }
    }
}

#Preview {
    BadgesView()
}
