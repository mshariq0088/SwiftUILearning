//
//  AsyncAwaitBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 08/07/25.
//

import SwiftUI

class AsyncAwaitBootCampViewModel: ObservableObject {
    
    @Published  var dataArray: [String] = []
    
    func addTitlte() {
        self.dataArray.append("Salman Khan")
    }
    
    func addTitle2() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let title2 = "Title: \(Thread.current)"
            DispatchQueue.main.async {
                self.dataArray.append(title2)
            }
        }
    }
    
    func addAuthor1() async {
        let author1 = "Author1 : \(Thread.current)"
        self.dataArray.append(author1)
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let author2 = "Author2: \(Thread.current)"
        await MainActor.run(body: {
            self.dataArray.append(author2)
            
            let author3 = "Author3: \(Thread.current)"
            self.dataArray.append(author3)
        })
    }
}

struct AsyncAwaitBootCamp: View {
    
    @StateObject private var viewModel = AsyncAwaitBootCampViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            //viewModel.addTitlte()
            Task {
                await viewModel.addAuthor1()
                await viewModel.addTitle2()
                
                let finalText = "Final Text: \(Thread.current)"
                viewModel.dataArray.append(finalText)
            }
        }
    }
}

#Preview {
    AsyncAwaitBootCamp()
}
