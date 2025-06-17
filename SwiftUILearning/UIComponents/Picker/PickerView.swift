//
//  PickerView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/06/25.
//

import SwiftUI

struct PickerView: View {
    
    @State var selection: String = "1"
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)).ignoresSafeArea()
            VStack(spacing: 30) {
                BackgroundView()
                HStack {
                    Text("Age: ")
                        .font(.headline)
                    Text(selection)
                }
                Picker(
                    selection: $selection,
                    label: Text("Picker"),
                    content: {
                        ForEach(18..<99) { number in
                            Text("\(number)")
                                .font(.headline)
                                .foregroundStyle(Color.black)
                                .tag("\(number)")
                        }
                })
                .pickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    PickerView()
}
