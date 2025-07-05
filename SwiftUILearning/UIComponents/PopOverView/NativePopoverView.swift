//
//  NativePopoverView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct NativePopoverView: View {
    
    @State private var showPopover: Bool = false
    @State private var feedbackOption: [String] = [
        "Very Good 🥳",
        "Average 😒",
        "Very Bed 😡"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
           Button(action: {
               showPopover.toggle()
           }, label: {
               Text("Provide Feedback")
                   .font(.title)
                   .foregroundStyle(.white)
                   .frame(height: 50)
                   .frame(maxWidth: .infinity)
                   .background(Color.black)
                   .cornerRadius(20)
           })
            
           .popover(isPresented: $showPopover, attachmentAnchor: .point(.top), content: {
               VStack(alignment: .center, spacing: 12, content: {
                   ForEach(feedbackOption, id: \.self) { option in
                       Button(option) {
                           
                       }
                       if option != feedbackOption.last {
                           Divider()
                       }
                   }
               })
                   .presentationCompactAdaptation(.popover)
                   .padding()
           })
           .padding(30)
        }
    }
}

#Preview {
    NativePopoverView()
}
