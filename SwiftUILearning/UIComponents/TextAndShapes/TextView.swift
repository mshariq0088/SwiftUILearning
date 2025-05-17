//
//  TextView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/05/25.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Welcome to the SwiftUI")
        //....Modifiers...
//            .font(.title)
//            .fontWeight(.bold)
            .underline(true, color: .cyan)
//            .italic(true)
            //.strikethrough(true, color: .white) // line in thecenter of the text
            .font(.system(size: 30, weight: .heavy, design: .rounded))
            .baselineOffset(10) // Space b/w lines
            //.kerning(10) // Space b/w words
            //.multilineTextAlignment(.leading) // use for multiple lines of text
            .foregroundStyle(.cyan) // For Text Color
            //.frame(width: 200, height: 200, alignment: .center)
            .minimumScaleFactor(0.2) // Set minimum scale for the text
    
        
        Text("Welcome to Swiftful thinking SwiftUI course. I am really enjoying this course and learning alot.")
            .font(.system(size: 20, weight: .medium, design: .rounded))
            .italic()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
            .baselineOffset(5)
//            .frame(width: 200, height: 200, alignment: .leading)
//           .minimumScaleFactor(0.1)
    }
}

#Preview {
    TextView()
}
