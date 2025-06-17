//
//  PickerSegmentExample.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/06/25.
//

import SwiftUI

struct PickerSegmentExample: View {
    
    @State var selection: String = "Most Recent"
    let filterOption: [String] = ["Most Recent", "Most Popular", "Most Liked"]
    
    var body: some View {
        Picker(selection: $selection,
               label: Text("Picker"),
               content: {
            ForEach(filterOption.indices) { index in
                Text(filterOption[index])
                    .tag(filterOption[index])
            }
        })
        .pickerStyle(.segmented)
        //Spacer()
    }
}

#Preview {
    PickerSegmentExample()
}
