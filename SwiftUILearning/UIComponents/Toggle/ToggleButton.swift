//
//  ToggleView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/06/25.
//

import SwiftUI

struct ToggleButton: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online 🤓" : "Offline 😣")
            }
            .font(.title)
            Toggle(isOn: $toggleIsOn, label: {
                Text("Change Status")
            })
            .toggleStyle(SwitchToggleStyle(tint: Color.green))
        }
        .padding(.horizontal, 90)
    }
}

#Preview {
    ToggleButton()
}
