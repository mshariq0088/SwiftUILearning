//
//  DatePickerView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/06/25.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var selectedDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)).ignoresSafeArea()
            VStack {
                Text("Selected date is: ")
                    .font(.headline)
                Text(dateFormatter.string(from: selectedDate))
                
                // DatePicker("Select a date", selection: $selectedDate)
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .accentColor(Color.black)
                    .datePickerStyle(
                        .compact
                        //.graphical
                        //.automatic
                        //.wheel
                    )
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DatePickerView()
}
