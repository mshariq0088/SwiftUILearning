//
//  ControlGroupMenuView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 06/07/25.
//

import SwiftUI

struct ControlGroupMenuView: View {
    var body: some View {
        Menu("My Menu") {
            ControlGroup {
                Button("Uno") {
                    
                }
                Button("Dos") {
                    
                }
                Menu("How are you") {
                    Button("Good") {
                        
                    }
                    Button("Bed") {
                        
                    }
                }
            }
            Button("Two") {
                
            }
            
            Menu("Three") {
                Button("Hi") {
                    
                }
                Button("Hello") {
                    
                }
            }
        }
    }
}

#Preview {
    ControlGroupMenuView()
}
