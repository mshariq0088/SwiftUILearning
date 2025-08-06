//
//  MultipleSheetBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 06/08/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1. Use a binding
// 2. Use multiple .sheet
// 3. Use $item

struct MultipleSheetBootCamp: View {
    
//    @State var selectedModel: RandomModel = RandomModel(title: "Stating Text")
    @State var selectedModel: RandomModel?
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                selectedModel = RandomModel(title: "One")
                //showSheet.toggle()
            }, label: {
                Text("SHEET-1")
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 30)
                    .background(Color.black)
                    .cornerRadius(20)
                
            })
            // 2. Multile .sheet
//            .sheet(isPresented: $showSheet, content: {
//                NextScreen(randomModel: RandomModel(title: "ONE"))
//            })
            
            Button(action: {
                selectedModel = RandomModel(title: "Two")
                //showSheet2.toggle()
            }, label: {
                Text("SHEET-2")
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 30)
                    .background(Color.black)
                    .cornerRadius(20)
                
            })
            // 2. Multile .sheet
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(randomModel: RandomModel(title: "TWO"))
//            })
        }
        
        // 1. Using Binding
//        .sheet(isPresented: $showSheet, content: {
//            NextScreen(randomModel: $selectedModel)
//        })
        
        .sheet(item: $selectedModel) { model in
            NextScreen(randomModel: model)
        }
        
    }
}


// 3. Using $item
struct ItemSheetView: View {
    @State var model: RandomModel?
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        model = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $model) { item in
                NextScreen(randomModel: item)
            }
        }
    }
}

struct NextScreen: View {
    
    //@Binding var  randomModel: RandomModel
    let randomModel: RandomModel
    
    var body: some View {
        Text(randomModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetBootCamp()
}
#Preview {
    ItemSheetView()
}
