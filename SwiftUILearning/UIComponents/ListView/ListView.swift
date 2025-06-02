//
//  ListView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/06/25.
//

import SwiftUI

struct ListView: View {
    
    @State var fruits: [String] = ["mango", "apple", "banana", "orange", "peach", "melon", "pineapple"]
    @State var vegetable: [String] = ["carrot", "potato", "tomato", "spinach", "broccoli", "cucumber", "cauliflower", "bell pepper", "onion",  "sweet potato"]
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        .font(.title)
                        .foregroundStyle(.orange)
                    ) {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit.capitalized)
                        }
                        .onDelete(perform: deleteFruits)
                        .onMove(perform: moveFruits)
                    }
                Section(
                    header:
                        HStack {
                            Text("Vegetables")
                            Image(systemName: "flame.fill")
                        }
                        .font(.title)
                        .foregroundStyle(.red)
                ) {
                        ForEach(vegetable, id: \.self) { veg in
                            Text(veg.capitalized)
                        }
                        .onDelete(perform: deleteVegiess)
                        .onMove(perform: moveVegiess)
                    }
            }
            .listStyle(.sidebar)
            .navigationTitle("Grocery Items")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton)
        }
        .accentColor(.purple)
    }
    
    //Button Variable
    var addButton: some View {
        Button("Add") {
            fruits.append("Coconuts")
            vegetable.append("Lady Finger")
        }
    }
    
    // Delete Fruits Items
    func deleteFruits(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    // Delete Vegetables Items
    func deleteVegiess(indexSet: IndexSet) {
        vegetable.remove(atOffsets: indexSet)
    }
    
    //Move Fruits Items
    func moveFruits(indices: IndexSet, to: Int) {
        fruits.move(fromOffsets: indices, toOffset: to)
    }
    
    //Move Vegetables Items
    func moveVegiess(indices: IndexSet, to: Int) {
        vegetable.move(fromOffsets: indices, toOffset: to)
    }
    
    //Add Vegiess and fruits
    func addItems() {
        fruits.append("Coconut")
        vegetable.append("Lady Finger")
        
    }
}

#Preview {
    ListView()
}
