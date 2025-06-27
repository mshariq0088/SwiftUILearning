//
//  AppStorageView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/06/25.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack(spacing: 20) {
                Text(currentUserName ?? "Add Name Here")
                
                Button("Save".uppercased()) {
                    let name: String = "Good Night Shariq"
                    currentUserName = name
                }
            }
        }
    }
}

#Preview {
    AppStorageView()
}
