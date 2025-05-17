//
//  SystemIcon_MultiColorIcon_SFSymbol.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/05/25.
//

import SwiftUI

struct SystemIcon_MultiColorIcon_SFSymbol: View {
    var body: some View {
        Text("SystemIcon-MultiColorIcon-SFSymbol")
            .font(.title)
            .multilineTextAlignment(.center)
        
        Image(systemName: "trash.fill")
            .resizable()
            //.font(.system(size: 200))
            .foregroundStyle(.brown)
            .frame(width: 200, height: 200)
        
        Image(systemName: "cart.fill.badge.plus")
            .renderingMode(.original) //template
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    SystemIcon_MultiColorIcon_SFSymbol()
        .preferredColorScheme(.dark)
}
