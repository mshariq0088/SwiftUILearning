//
//  AsyncStreamBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 26/07/25.
//

import SwiftUI

class AsyncStreamDataManager {
    
    func getAsyncStream() -> AsyncThrowingStream<Int, Error> {
        AsyncThrowingStream(Int.self) { [weak self] continuation in
            self?.fakeData(newValue: { value in
                continuation.yield(value)
            }, onFinish: { error in
                continuation.finish(throwing: error)
            })

        }
    }
    
    func fakeData(newValue: @escaping (_ value: Int) -> Void,
                  onFinish: @escaping (_ error: Error?) -> Void
    ) {
        let items: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for item in items {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(item), execute: {
                newValue (item)
                print("New Data: \(item )")
                
                if item == items.last {
                    onFinish(nil)
                }
            })
        }
    }
}

@MainActor
class AsyncStreamBootCampViewModel: ObservableObject {
    
    let dataManager = AsyncStreamDataManager()
    @Published private(set) var currentValue: Int = 0
    
    func onViewAppear() {
//        dataManager.fakeData { [weak self] value in
//            self?.currentValue = value
//        }
        
       let task =  Task {
            do {
                for try await value in dataManager.getAsyncStream() {
                    currentValue = value
                }
            } catch {
                print(error)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            task.cancel() 
        })
    }
}

struct AsyncStreamBootCamp: View {
    
    @StateObject private var viewModel = AsyncStreamBootCampViewModel()
    
    var body: some View {
        Text("\(viewModel.currentValue)")
            .font(.title)
        
            .onAppear {
                viewModel.onViewAppear()
            }
    }
}

#Preview {
    AsyncStreamBootCamp()
}
