//
//  FormBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/08/25.
//

import SwiftUI

struct FormBootCamp: View {
    
//   @State var count = 0
//    @State private var name: String = ""
    
    let student = ["Shariq", "Abid", "Hashim", "Aamir"]
    @State private var selectedStrudent = "Shariq"
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipParcentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 15, 20, 25, 30]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipParcentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipParcentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your Student", selection: $selectedStrudent) {
                    ForEach(student, id: \.self) {
                        Text($0)
                    }
                }
                
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section {
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(0..<101) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section {
                    Text("How much tip do you want to leave?")
                    Picker("Tip Percentage", selection: $tipParcentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                
                
                Section {
                    Text("Amount Per Person")
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                Section {
                    Text("Total amount for check")
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
//
//        Form {
//            TextField("Enter your name..", text: $name)
//            
//        }
//        
//        Button("Tap Count: \(count)") {
//            count += 1
//        }
        
//        Form {
////            Section {
////                HStack {
////                    ForEach(list, id: \.self) { item in
////                        Text(item)
////                        Spacer()
////                        Image(systemName: "heart.fill")
////                    }
////                }
////            }
//           
//            Section {
//                Text("Vegitable List")
//                Text("Vegitable List")
//                Text("Vegitable List")
//            }
//            
//        }
    }
}

#Preview {
    FormBootCamp()
}
