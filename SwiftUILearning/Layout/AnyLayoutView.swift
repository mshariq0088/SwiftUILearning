//
//  AnyLayoutView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct AnyLayoutView: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
            
            
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout {
                Text("Alpha")
                Text("Beta")
                Text("Gama")
            }
//            if horizontalSizeClass == .compact {
//                VStack {
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gama")
//                }
//                } else {
//                    HStack {
//                        Text("Alpha")
//                        Text("Beta")
//                        Text("Gama")
//                }
//            }
        }
    }
}

#Preview {
    AnyLayoutView()
}
