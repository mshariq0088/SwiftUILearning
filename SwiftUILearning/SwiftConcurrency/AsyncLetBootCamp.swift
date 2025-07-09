//
//  AsyncLetBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 09/07/25.
//

import SwiftUI

struct AsyncLetBootCamp: View {
    
    @State private var images: [UIImage] = []
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/200")!
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                    }
                }
            }
            .navigationTitle("Async Let 🥳")
            .onAppear {
                Task {
                    do {
                        
                        //MARK: - Used Async Let for load image same time but this not a good way to load 50-100 image so we use (TaskGroup)
                        async let fatchImage1 = fatchImage()
                        async let fatchImage2 = fatchImage()
                        async let fatchImage3 = fatchImage()
                        async let fatchImage4 = fatchImage()
                        
                        let (image1, image2, image3, image4) = await (try fatchImage1, try fatchImage2, try fatchImage3, try fatchImage4)
                        
                        self.images.append(contentsOf: [image1, image2, image3, image4])
                        
                        
                        
//                        let image1 = try await fatchImage()
//                        self.images.append(image1)
//                        
//                        let image2 = try await fatchImage()
//                        self.images.append(image2)
//                        
//                        let image3 = try await fatchImage()
//                        self.images.append(image3)
//                        
//                        let image4 = try await fatchImage()
//                        self.images.append(image4)
                    } catch {
                        
                    }
                }
            }
        }
    }
    
    func fatchImage() async throws -> UIImage {
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

#Preview {
    AsyncLetBootCamp()
}
