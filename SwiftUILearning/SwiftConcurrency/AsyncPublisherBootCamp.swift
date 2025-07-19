//
//  AsyncPublisherBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/07/25.
//

import SwiftUI
import Combine

class AsyncPublisherBootCampDataManager {
    @Published var myData: [String] = []
    
    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Banana")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Kiwi")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Pineapple")
    }
}

class AsyncPublisherBootCampViewModel: ObservableObject {
    @MainActor @Published var dataArray: [String] = []
    let manager = AsyncPublisherBootCampDataManager()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
   private func addSubscribers() {
       
       //MARK: - Create for each loop to listen the AsyncPublisher
       Task {
           for await value in manager.$myData.values {
               await MainActor.run(body: {
                   self.dataArray = value
               })
           }
       }
       
       
       //MARK: - Call Combine Methods
//       manager.$myData
//           .receive(on: DispatchQueue.main)
//           .sink { dataArray in
//               self.dataArray = dataArray
//           }
//           .store(in: &cancellable)
    }
    
    func getData() async {
       await manager.addData()
        
    }
}

struct AsyncPublisherBootCamp: View {
    
    @StateObject private var vm = AsyncPublisherBootCampViewModel()
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(vm.dataArray, id: \.self) {
                        Text($0)
                            .font(.headline)
                    }
                }
                .padding(.top, 300)
            }
        }
        .task {
            await vm.getData()
        }
    }
}

#Preview {
    AsyncPublisherBootCamp()
}
