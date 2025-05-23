//
//  LazyVGridViewExample.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/05/25.
//

import SwiftUI

struct LazyVGridViewExample: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
                .cornerRadius(10)
                .overlay(
                    Image("novita")
                        .resizable()
                        .frame(width: 300, height: 300)
                )
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    Section(header:
                                Text("Patati")
                                .foregroundStyle(Color.black)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.gray.opacity(0.7))
                                .padding()
                                
                    
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.brown)
                                .frame(height: 150)
                                .cornerRadius(20)
                                .overlay(
                                    Image("patati")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                )
                                
                        }
                    }
                    
                    Section(header:
                                Text("Goku")
                                .foregroundStyle(Color.black)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.blue.opacity(0.7))
                                .padding()
                                
                    ) {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(height: 150)
                                .cornerRadius(20)
                                .overlay(
                                    Image("goku")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                )
                        }
                    }
                }
            )
        }
    }
}

#Preview {
    LazyVGridViewExample()
}
