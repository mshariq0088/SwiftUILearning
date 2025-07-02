//
//  ListSwapActionView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

struct ListSwapActionView: View {
    
    @State var fruits: [String] = ["mango", "apple", "banana", "orange", "peach", "melon", "pineapple"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Archive") {
                            
                        }
                        .tint(.blue)
                        
                        Button("Save") {
                            
                        }
                        .tint(.green)
                        
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    }
                
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
                    
            }
        }
    }
}

#Preview {
    ListSwapActionView()
}
