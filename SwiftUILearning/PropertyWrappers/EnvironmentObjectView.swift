//
//  EnvironmentObjectView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 27/06/25.
//

import SwiftUI

// ObserveObject
// StateObject
// EnvironmentObject

class EnvironmentObjectViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    @Published var imagesArray: [UIImage] = []
    
    init() {
       getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac",  "iPod", "Apple watch"])
       
        let imageNames = ["iphone", "ipad", "imac", "iPod", "appleWatch"]
        
        for name in imageNames {
            if let image = UIImage(named: name) {
                self.imagesArray.append(image)
            }
        }
        
    }
}

struct EnvironmentObjectView: View {
    
    @StateObject var viewModel: EnvironmentObjectViewModel = EnvironmentObjectViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                    destination: iosDevicesDetailView(selectedItem: item),
                    label: {
                        Text(item)
                    })

                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}

struct iosDevicesDetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            
            NavigationLink(
                destination: finalScreen(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                })
        }
    }
}

struct finalScreen: View {
    
    @EnvironmentObject var viewModel: EnvironmentObjectViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.imagesArray, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150, alignment: .center)
                            .cornerRadius(20)
                    }
                }
                .foregroundStyle(.black)
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    EnvironmentObjectView()
}
