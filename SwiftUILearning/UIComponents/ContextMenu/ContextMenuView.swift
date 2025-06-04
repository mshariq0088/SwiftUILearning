//
//  ContextMenuView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/06/25.
//

import SwiftUI

struct ContextMenuView: View {
    
    @State var backgroundColor: Color = Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Learing BootCamp")
                .font(.headline)
            Text("How to use context menu in SwiftUI")
                .font(.footnote)
        }
        .foregroundStyle(Color.white)
        .padding(30)
        .background(backgroundColor)
        .cornerRadius(20)
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .pink
            }, label: {
                Label("Share Post", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = .green
            }, label: {
                Text("Repport Post")
            })
            
            Button(action: {
                backgroundColor = .brown
            }, label: {
                HStack {
                    Text("Like Post")
                    Image(systemName: "heart.fill")
                }
            })
        })
    }
}

#Preview {
    ContextMenuView()
}
