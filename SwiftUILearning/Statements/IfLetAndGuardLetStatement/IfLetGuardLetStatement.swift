//
//  IfLetGuardLetStatement.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 23/06/25.
//

import SwiftUI

struct IfLetGuardLetStatement: View {
    
    @State var currentUserId: String? = "594"
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding!")
                
                if let text = displayText {
                    Text(text)
                        .font(.headline)
                }
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                //loadData()
                loadNewData()
            }
        }
    }
    
    func loadData() {
        //MARK: - Using if let statement
        if let userId = currentUserId {
            
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new user id: \(userId)"
                isLoading = false
            }
        } else {
            displayText = "Error, there is no user id"
        }
    }
    
    func loadNewData() {
        //MARK: - Using guard statement
        guard let userId = currentUserId else {
            displayText = "Error, there is no user id"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new user id: \(userId)"
            isLoading = false
        }
    }
}

#Preview {
    IfLetGuardLetStatement()
}
