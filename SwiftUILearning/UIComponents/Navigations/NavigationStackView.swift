//
//  NavigationStack.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 03/07/25.
//

import SwiftUI

struct NavigationStackView: View {
    
    let fruits = ["Apple", "Banana", "Orange"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(0..<10) { x in
                        NavigationLink(
                            destination: {
                                OtherScreen(value: x)
                            },
                            label: {
                                Text("Click me: \(x)")
                            }
                        )
                    }
                }
                .navigationTitle("Nav Bootcamp")
                .navigationDestination(for: Int.self) { value in
                    OtherScreen(value: value)
                }
                
                .navigationDestination(for: String.self) { value in
                    Text("Another Screen: \(value)")
                }
            }
        }
    }

}

struct OtherScreen: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavigationStackView()
}
