//
//  MVVMBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/07/25.
//

import SwiftUI

final class MyManagerClass {
    func getData() async throws -> String {
        "MVVM Data!"
    }
}

actor MyManagerActor {
    func getData() async throws -> String {
        "MVVM Data!"
    }
}

@MainActor
final class MVVMBootCmapViewModel: ObservableObject {
    let managerClass = MyManagerClass()
    let managerActor = MyManagerActor()
    
    @MainActor @Published private(set) var myData: String = "New Data"
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTask() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    //@MainActor
    func onButtonClick() {
        let task = Task {
            do {
                myData = try await managerClass.getData()
            } catch {
                print(error )
            }
        }
        tasks.append(task)
    }
}

struct MVVMBootCamp: View {
    
    @StateObject private var vm = MVVMBootCmapViewModel()
    
    var body: some View {
        VStack {
            Button(vm.myData) {
                vm.onButtonClick()
            }
        }
        .onDisappear {
            
        }
    }
}

#Preview {
    MVVMBootCamp()
}
