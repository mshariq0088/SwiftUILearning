//
//  ToolBarVIew.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/07/25.
//

import SwiftUI

struct ToolBarVIew: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo.ignoresSafeArea()
                
                ScrollView {
                    ForEach(0..<40) { _ in
                        Rectangle()
                            //.fill(Color.white)
                            .frame(width: 200, height: 200)
                            .cornerRadius(30)
                    }
                }
            }
            .navigationTitle("Toolbar")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            })
            //.toolbarBackgroundVisibility(.hidden, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu {
                Button("Male") {
                
                }
                
                Button("Female") {
                
                }
            }
        }
    }
}

#Preview {
    ToolBarVIew()
}
