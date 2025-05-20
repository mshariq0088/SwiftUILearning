//
//  SpacerWithImages.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/05/25.
//

import SwiftUI

struct SpacerWithImages: View {
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Image(systemName: "house.fill")
                    
                Spacer()
                
                Image(systemName: "bookmark.fill")
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            Spacer()
            
            Text("Spacer With Images")
                .font(.largeTitle)
                .underline()
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 66)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0, y: 10)
                .cornerRadius(20)
                .overlay(
                    HStack {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "music.note.list")
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Image(systemName: "checklist.unchecked")
                            .font(.largeTitle)
                    }
                        .padding(.horizontal)
                )
                .padding(.all)
            
        }
        .background(Color.yellow.opacity(0.6))
    }
}

#Preview {
    SpacerWithImages()
}
