//
//  TaskGroupBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 10/07/25.
//

import SwiftUI

class TaskGroupBootCampDataManager {
    
    //MARK: - Async Let
    func fatchImageWithAsyncLet() async throws -> [UIImage] {
        //let imageUrl = URL(string: "https://picsum.photos/200")!
        async let fatchImage1 = fatchImage(urlString: "https://picsum.photos/200")
        async let fatchImage2 = fatchImage(urlString: "https://picsum.photos/200")
        async let fatchImage3 = fatchImage(urlString: "https://picsum.photos/200")
        async let fatchImage4 = fatchImage(urlString: "https://picsum.photos/200")
        
        let (image1, image2, image3, image4) = await (try fatchImage1, try fatchImage2, try fatchImage3, try fatchImage4)
       return [image1, image2, image3, image4]
        
    }
    
    //MARK: - Task Group
    func fatchImagesWithTaskGroup() async throws -> [UIImage] {
        let urlStrings = [
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200"
        ]
        
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []
            
            images.reserveCapacity(urlStrings.count)
            
            for urlString in urlStrings {
                group.addTask {
                    try? await self.fatchImage(urlString: urlString)
                }
            }
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            return images
        }
    }
    
    private func fatchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch  {
            throw error
        }
    }
}

class TaskGroupBootCampViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let dataManager = TaskGroupBootCampDataManager()
    
    func getImages() async {
//        if let image = try? await dataManager.fatchImageWithAsyncLet() {
//            self.images.append(contentsOf: image)
//        }
        
        if let image = try? await dataManager.fatchImagesWithTaskGroup() {
            self.images.append(contentsOf: image)
        }
    }
}

struct TaskGroupBootCamp: View {
    
    @StateObject private var viewModel = TaskGroupBootCampViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                    }
                }
            }
            .navigationTitle("Task Group 🥳")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

#Preview {
    TaskGroupBootCamp()
}
