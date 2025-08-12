//
//  SoundBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/08/25.
//

import SwiftUI
import AVKit

class SoundManager: ObservableObject {
    
    static let instance = SoundManager() // Singleton
    
    var player: AVAudioPlayer?
    
    
    enum Sound: String {
        case tada
        case badum
    }
    
    func playSound(sound: Sound) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
         
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error Play sound:\(error.localizedDescription)")
        }
    }
}

struct SoundBootCamp: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(spacing: 20) {
                Button(action: {
                    SoundManager.instance.playSound(sound: .tada)
                }, label: {
                    Text("TADA 🔉")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(20)
                })
                
                Button(action: {
                    SoundManager.instance.playSound(sound: .badum)
                }, label: {
                    Text("BADUM 🔉")
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
    SoundBootCamp()
}
