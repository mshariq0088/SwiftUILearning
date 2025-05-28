//
//  TransitionView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 28/05/25.
//

import SwiftUI

struct TransitionView: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Transition Buttom") {
                    showView.toggle()
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.black)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.move(edge: .bottom))
                    .animation(.easeOut)
                    .overlay {
                        VStack(spacing: 40) {
                            Image(systemName: "person.badge.shield.checkmark.fill")
                                .resizable()
                                .foregroundStyle(Color.white)
                                .frame(width: 40, height: 40)
                            Text("Welcome Mohammad Shariq Ansari")
                                .font(.title)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Software Engineer 🍎")
                                .font(.title)
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
//                    .animation(Animation.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1.0))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TransitionView()
}
