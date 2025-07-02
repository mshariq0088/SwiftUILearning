//
//  AsyncImageView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

struct AsyncImageView: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9843392968, green: 0.693606019, blue: 0.2520262599, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(20)
                    Text("Downloaded Image")
                        .font(.largeTitle)
                case .failure(let error):
                    Image(systemName: "questionmark")
                        .font(.largeTitle)
                }
            }
            
//            AsyncImage(url: url) { returnedImage in
//                returnedImage
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//                    .cornerRadius(20)
//                Text("Downloaded Image")
//                    .font(.largeTitle)
//            } placeholder: {
//                ProgressView()
//            }
        }

    }
}

#Preview {
    AsyncImageView()
}
