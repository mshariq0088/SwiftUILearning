//
//  PickerExample.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/06/25.
//

import SwiftUI

struct PickerMenuExample: View {
    
    @State var selection: String = ""
    let filterOption: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    
    var body: some View {
        Picker(
            selection: $selection,
            label:
                HStack {
                   Text("Filter: ")
                    Text(selection)
                }
                .font(.headline)
                .foregroundStyle(Color.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(color: Color.blue.opacity(0.3),radius: 10, x: 0, y: 10)
            ,
            content: {
                ForEach(filterOption, id: \.self) { option in
                    HStack {
                        Text(option)
                        Image(systemName: "heart.fill")
                    }
                    .tag(option)
                }
            })
        .pickerStyle(.menu)
    }
}

#Preview {
    PickerMenuExample()
}
