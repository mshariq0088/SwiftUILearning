//
//  ResizableSheetView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct ResizableSheetView: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button("Click Me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            nextScreenView()
                .presentationDetents([.fraction(0.2), .height(300), .medium, .large])
                //.presentationDetents([.medium, .large])
                //.presentationDragIndicator(.hidden)
        }
    }
}

struct nextScreenView: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text("Open New Sheet")
        }
    }
}

#Preview {
    ResizableSheetView()
}
