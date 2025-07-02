//
//  TextSelectionView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

struct TextSelectionView: View {
    var body: some View {
        Text("Hello, World!")
        // MARK: - Text Selection
            .textSelection(.enabled)
        
    }
}

#Preview {
    TextSelectionView()
}
