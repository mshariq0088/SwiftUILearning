//
//  TapGestureView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/06/25.
//

import SwiftUI

struct TapGestureView: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 200)
                    .foregroundStyle(isSelected ? Color.green : Color.yellow)
                
                
                // MARK: - Button Action
                Button(action: {
                    isSelected.toggle()
                }, label: {
                    Text("Button")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(20)
                })
                
                // MARK: - Tap Gesture Action
                Text("Tap Gesture")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(20)
                    .onTapGesture {
                        isSelected.toggle()
                    }
                // MARK: - Use Double Tap Gesture
                //                .onTapGesture(count: 2, perform: {
                //                    isSelected.toggle()
                //                })
                
                Spacer()
            }
            .padding()
            .navigationTitle("Tap Gesture BootCamp")
        }
    }
}

#Preview {
    TapGestureView()
}
