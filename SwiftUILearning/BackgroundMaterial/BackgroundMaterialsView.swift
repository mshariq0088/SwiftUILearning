//
//  BackgroundMaterialsView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

struct BackgroundMaterialsView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
               RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            
            // Background Materials
            /*
             .ultraThinMaterial
             .ultraThickMaterial
             */
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .ignoresSafeArea()
        .background(
            Image("novita")
        )
    }
}

#Preview {
    BackgroundMaterialsView()
}
