//
//  ViewModelView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 25/06/25.
//

//Property Wrappers
// 1.@Published
// 2.@ObservedObject
// 3.@StateObject
// 4.@State
// 5.@Environment

import SwiftUI

struct FruitsModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}
 
class FruitsViewModel: ObservableObject {
    @Published var fruitsArray: [FruitsModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitsModel(name: "Apple", count: 29)
        let fruit2 = FruitsModel(name: "Banana", count: 24)
        let fruit3 = FruitsModel(name: "Oranage", count: 30)
        let fruit4 = FruitsModel(name: "Watermelon", count: 3)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitsArray.append(fruit1)
            self.fruitsArray.append(fruit2)
            self.fruitsArray.append(fruit3)
            self.fruitsArray.append(fruit4)
            self.isLoading = false
        }
        
    }
    
    func onDelete(index: IndexSet) {
        fruitsArray.remove(atOffsets: index)
    }
}

struct ViewModelView: View {
    
    //@State var fruitsArray: [FruitsModel] = []
//   @ObservedObject var fruitsViewModel: FruitsViewModel = FruitsViewModel()
    
    // @StateObject -> USE THIS ON CREATION
    // @ObservedObject -> USE THIS FOR SUBVIEW
    @StateObject var fruitsViewModel: FruitsViewModel = FruitsViewModel()

    
    var body: some View {
        NavigationView {
            List {
                
                if fruitsViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitsViewModel.fruitsArray) { fruit in
                        HStack {
                            Text(fruit.name)
                                .font(.title)
                            Spacer()
                            Text("\(fruit.count)")
                                .font(.headline)
                                .foregroundStyle(.black)
                        }
                    }
                    .onDelete(perform: fruitsViewModel.onDelete)
                }
            }
            .padding()
            .listStyle(.grouped)
            .navigationTitle("Fruits List")
            .navigationBarItems(trailing: NavigationLink(destination: SecondScreen(fruitViewModel: fruitsViewModel), label: {
                Image(systemName: "arrow.right")
                    .font(.headline)
                    .foregroundStyle(.black)
            }))
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitsViewModel
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                ForEach(fruitViewModel.fruitsArray) { fruit in
                    Text(fruit.name)
                        .font(.headline)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    ViewModelView()
}
