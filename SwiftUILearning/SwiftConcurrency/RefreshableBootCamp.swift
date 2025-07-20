//
//  RefreshableBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 20/07/25.
//

import SwiftUI

final class RefreshableDataManager {
    func getData() async throws -> [String] {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        return ["Apple", "Banana", "Oranges", "Pineapple"].shuffled()
    }
}

@MainActor
final class RefreshableBootCampViewModel: ObservableObject {
    @Published private(set) var items: [String] = []
    let manager = RefreshableDataManager()
    
    func loadData() async {
        do {
            items = try await manager.getData()
        } catch {
            print(error)
        }
    }
    
}

struct RefreshableBootCamp: View {
    
    @StateObject private var viewModel = RefreshableBootCampViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.headline)
                    }
                }
            }
            .refreshable {
                await viewModel.loadData()
            }
            .padding(.top, 40)
            .navigationTitle("Refreshable Data")
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    RefreshableBootCamp()
}
