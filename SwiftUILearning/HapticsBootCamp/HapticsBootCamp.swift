//
//  HapticsBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/08/25.
//

import SwiftUI

class HapticsManager {
    
    static let instance = HapticsManager() // Singleton
    
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootCamp: View {
    var body: some View {
        
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack(spacing: 20) {
                Button(action: {
                    HapticsManager.instance.notification(type: .success)
                }, label: {
                    Text("Success 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                
                Button(action: {
                    HapticsManager.instance.notification(type: .warning)
                }, label: {
                    Text("Warning 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                
                Button(action: {
                    HapticsManager.instance.notification(type: .error)
                }, label: {
                    Text("Error 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                
                Divider()
                
                Button(action: {
                    HapticsManager.instance.impact(style: .soft)
                }, label: {
                    Text("Soft 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                Button(action: {
                    HapticsManager.instance.impact(style: .light)
                }, label: {
                    Text("Light 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                Button(action: {
                    HapticsManager.instance.impact(style: .medium)
                }, label: {
                    Text("Medium 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                Button(action: {
                    HapticsManager.instance.impact(style: .rigid)
                }, label: {
                    Text("Rigid 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                Button(action: {
                    HapticsManager.instance.impact(style: .heavy)
                }, label: {
                    Text("Heavy 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
            }
        }
    }
}

#Preview {
    HapticsBootCamp()
}
