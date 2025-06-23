//
//  OnAppearsView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 23/06/25.
//

import SwiftUI

struct OnAppearsView: View {
    
    @State var myText: String = "Start Text"
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This the new Text"
                }
            })
            .onDisappear(perform: {
                myText = "Ending Text"
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

#Preview {
    OnAppearsView()
}
