//
//  LoadingView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/05/25.
//

import SwiftUI

struct LoadingView: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Loading Button: \(isLoading.description)") {
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
