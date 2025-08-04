//
//  GeometryReaderBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/08/25.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false,  content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 10)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300,height: 250)
                    .padding()
                }
            }
        })
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeometryReaderBootCamp()
}
