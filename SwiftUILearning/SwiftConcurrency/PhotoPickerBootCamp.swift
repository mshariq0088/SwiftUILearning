//
//  PhotoPickerBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 22/07/25.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerBootCampViewModel: ObservableObject {
    
    
    //MARK: - Single Image Selection
    @Published private(set) var seletedImage: UIImage? = nil
    @Published var photoSelection: PhotosPickerItem? = nil {
        
        didSet {
            setImage(from: photoSelection)
        }
    }
    
    //MARK: - Single Image Selection
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            if let data = try await selection.loadTransferable(type: Data.self) {
                if let Uiimage = UIImage(data: data) {
                    seletedImage = Uiimage
                    return
                }
            }
        }
    }
    
    
    
    //MARK: - Multiple Image Selection
    @Published private(set) var seletedImages: [UIImage] = []
    @Published var photoSelections: [PhotosPickerItem] = [] {
        
        didSet {
            setMultipleImages(from: photoSelections)
        }
    }
    
    //MARK: - Multiple Image Selection
    private func setMultipleImages(from selections: [PhotosPickerItem]) {
        Task {
            var images: [UIImage] = []
            for selection in selections {
                if let data = try await selection.loadTransferable(type: Data.self) {
                    if let Uiimage = UIImage(data: data) {
                        images.append(Uiimage)
                    }
                }
            }
             seletedImages = images
        }
    }
}

struct PhotoPickerBootCamp: View {
    
    @StateObject private var viewModel = PhotoPickerBootCampViewModel()
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.5).ignoresSafeArea()
            VStack(spacing: 20) {
                if let image = viewModel.seletedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                }
                PhotosPicker(selection: $viewModel.photoSelection) {
                    Text("Select Single Photo")
                        .foregroundStyle(.red)
                }
                
                if !viewModel.seletedImages.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.seletedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.leading, 40)
                    }
                }
                
                PhotosPicker(selection: $viewModel.photoSelections) {
                    Text("Select Multiple Photos")
                        .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("Image Picker")
    }
}

#Preview {
    NavigationStack {
        PhotoPickerBootCamp()
    }
}
