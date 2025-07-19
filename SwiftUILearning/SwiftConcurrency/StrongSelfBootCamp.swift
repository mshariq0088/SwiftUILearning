//
//  StrongSelfBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/07/25.
//

import SwiftUI

final class StrongSelfDatamanager {
    func getData() async -> String {
        "Strong Self Boot Camp"
    }
}

final class StrongSelfBootCampViewModel: ObservableObject {
    @Published  var data: String = "Data"
    let dataManager = StrongSelfDatamanager()
    private var someTask: Task<Void, Never>? = nil
    private var myTask: [Task<Void, Never>] = []
    
    func cancelTask() {
        someTask?.cancel()
        someTask = nil
        
        myTask.forEach({ $0.cancel() })
        myTask = []
    }
    
    //MARK: - This is implise the strong reference
    func updateData() {
        Task {
           data = await dataManager.getData()
        }
    }
    
    //MARK: - This is a strong reference
    func updateData2() {
        Task {
            self.data = await self.dataManager.getData()
        }
    }
    
    //MARK: - This is strong reference
    func updateData3() {
        Task { [self] in
            self.data = await self.dataManager.getData()
        }
    }
    
    //MARK: - This is Weak reference
    func updateData4() {
        Task { [weak self] in
            if let data = await self?.dataManager.getData() {
                self?.data = data
            }
        }
    }
    
    //MARK: - we do not need to manage weak/strong
    // we can manage task
    func updateData5() {
       someTask =  Task {
            self.data = await self.dataManager.getData()
        }
    }
    
    //MARK: - We can manage the Task!
    func updateData6() {
       let task1 =  Task {
            self.data = await self.dataManager.getData()
        }
        myTask.append(task1)
        
        let task2 =  Task {
             self.data = await self.dataManager.getData()
         }
        myTask.append(task2)
    }
    
    //MARK: - We purposely do not cancel the tasks to keep strong reference
    func updateData7() {
       Task {
            self.data = await self.dataManager.getData()
        }
        Task.detached {
            self.data = await self.dataManager.getData()
        }
    }
}

struct StrongSelfBootCamp: View {
    
    @StateObject private var vm = StrongSelfBootCampViewModel()
    
    
    var body: some View {
        Text(vm.data)
            .font(.headline)
            .onAppear {
                vm.updateData()
            }
            .onDisappear {
                vm.cancelTask()
            }
    }
}

#Preview {
    StrongSelfBootCamp()
}
