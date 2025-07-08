//
//  TaskBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 08/07/25.
//

import SwiftUI

class TaskBootCampViewModel: ObservableObject {
    @Published var image1: UIImage? = nil
    @Published var image2: UIImage? = nil

    func fatchImage1() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image1 = UIImage(data: data)
            })
            
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func fatchImage2() async {
        try?  await Task.sleep(nanoseconds: 5_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
            })
            
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}

struct TaskBootCamp: View {
    
    @StateObject private var viewModel = TaskBootCampViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image1 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:  200, height: 200)
                    .cornerRadius(30)
            }
            
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:  200, height: 200)
                    .cornerRadius(30)
            }
        }
        .task {
            await viewModel.fatchImage1()
        }
        .task {
            await viewModel.fatchImage2()
        }
//        .onAppear {
//            Task {
//                await viewModel.fatchImage1()
////                await viewModel.fatchImage2()
//            }
//            Task {
//                await viewModel.fatchImage2()
//            }
//        }
    }
}

#Preview {
    TaskBootCamp()
}
