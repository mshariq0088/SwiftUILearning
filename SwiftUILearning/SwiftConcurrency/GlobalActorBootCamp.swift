//
//  GlobalActorBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/07/25.
//

import SwiftUI

@globalActor struct myFirstGlobalActor {
    static var shared = myNewDataManager()
}

actor myNewDataManager {
    func getDataFromDatabase() -> [String] {
        return ["Apple", "Orange", "Mango", "Banana", "Peach", "PineApple"]
    }
}

class GlobalActorBootCampViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    let manager = myFirstGlobalActor.shared
    
   @myFirstGlobalActor func getData() async {
       Task {
           let data = await manager.getDataFromDatabase()
           self.dataArray = data
       }
    }
}

struct GlobalActorBootCamp: View {
    
    @StateObject private var vm = GlobalActorBootCampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await vm.getData()
        }
    }
}

#Preview {
    GlobalActorBootCamp()
}
