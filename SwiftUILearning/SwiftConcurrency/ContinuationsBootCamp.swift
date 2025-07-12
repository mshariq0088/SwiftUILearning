//
//  ContinuationsBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 12/07/25.
//

import SwiftUI

class ContinuationsBootCampNetworkManager {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw error
        }
    }
    
    
    //MARK: - Using Continuation Method
    func getDataUsingContinuations(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        }
    }
    
    func getAssetsImageFromDatabase(completionHandler: @escaping(_ image: UIImage) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completionHandler(UIImage(named: "patati")!)
        }
    }
    
    func getAssetsImageFromDatabase() async -> UIImage {
        await withCheckedContinuation { continuation in
            getAssetsImageFromDatabase { image in
                continuation.resume(returning: image)
            }
        }
    }
}


class ContinuationsBootCampViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let netwarkManager = ContinuationsBootCampNetworkManager()
     
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        do {
//            let data = try await netwarkManager.getData(url: url)
            let data = try await netwarkManager.getDataUsingContinuations(url: url )
            
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
        } catch  {
            print(error)
        }
    }
    
    func getHeatImage() async {
        self.image = await netwarkManager.getAssetsImageFromDatabase()
    }
    
}

struct ContinuationsBootCamp: View {
    
    @StateObject private var viewModel = ContinuationsBootCampViewModel()
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    //.cornerRadius(30)
            }
        }
        .task {
           // await viewModel.getImage()
            await viewModel.getHeatImage()
        }
    }
}

#Preview {
    ContinuationsBootCamp()
}
