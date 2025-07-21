//
//  SearchableBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 21/07/25.
//

import SwiftUI
import Combine

struct Restaurant: Identifiable, Hashable {
    let id: String
    let title: String
    let cuisine: CuisineOption
}

enum CuisineOption: String {
    case indian, amrican, italian, japanese
}

final class RestaurantManager {
    
    func getAllRestaurants() async throws -> [Restaurant] {
        [
            Restaurant(id: "1", title: "Chole Bhature", cuisine: .indian),
            Restaurant(id: "2", title: "Burger", cuisine: .amrican),
            Restaurant(id: "3", title: "Sushi", cuisine: .japanese),
            Restaurant(id: "4", title: "Pasta", cuisine: .italian),
        ]
    }
}

@MainActor
final class SearchableBootCampViewModel: ObservableObject {
    
    @Published private(set) var allRestaurants: [Restaurant] = []
    @Published private(set) var filterRestaurants: [Restaurant] = []
    @Published var searchText: String = ""
    @Published var searchScope: searchSecopeOption = .all
    @Published private(set) var allSearchScope: [searchSecopeOption] = []
    let manager = RestaurantManager()
    private var cancellable = Set<AnyCancellable>()
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    var showSearchSuggestion: Bool {
        searchText.count < 3
    }
    
    enum searchSecopeOption: Hashable {
        case all
        case cuisine(option: CuisineOption)
        
        var title: String {
            switch self {
            case .all:
                return "All"
            case .cuisine(option: let option):
                return option.rawValue.capitalized
            }
        }
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest($searchScope)
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] (searchText, searchScope) in
                self?.filterRestaurants(searchText: searchText, currentSearchScope: searchScope)
            }
            .store(in: &cancellable )
    }
    
    private func filterRestaurants(searchText: String, currentSearchScope: searchSecopeOption) {
        guard !searchText.isEmpty else {
            filterRestaurants = []
            searchScope = .all
            return
        }
        
        //MARK: - Filter on search scope
        var restaurantInScope = allRestaurants
        switch currentSearchScope {
        case .all:
            break
        case .cuisine(let option):
            restaurantInScope = allRestaurants.filter({ $0.cuisine == option })
        }
        
        //MARK: - Filter on search text
        let search = searchText.lowercased()
        filterRestaurants = restaurantInScope.filter({ restaurant in
            let titleContainsSearch = restaurant.title.lowercased().contains(search)
            let cuisineContainsSearch = restaurant.cuisine.rawValue.lowercased().contains(search)
            return titleContainsSearch || cuisineContainsSearch
        })
    }
    
    func loadRestaurants() async {
        do {
            allRestaurants = try await manager.getAllRestaurants()
            
            let allCuisine = Set(allRestaurants.map { $0.cuisine })
            allSearchScope = [.all] + allCuisine.map({ searchSecopeOption.cuisine(option: $0)})
        } catch {
            print(error)
        }
    }
    
    func getSearchSuggestions() -> [String] {
        
        guard showSearchSuggestion else {
            return []
        }
        var suggestions: [String] = []
        
        let search = searchText.lowercased()
        if search.contains("pa") {
            suggestions.append("Pasta")
        }
        if search.contains("ch") {
            suggestions.append("Chole Bhature")
        }
        if search.contains("bu") {
            suggestions.append("Burger")
        }
        if search.contains("su") {
            suggestions.append("Sushi")
        }
        suggestions.append("Market")
        suggestions.append("Grocery")
        
        suggestions.append(CuisineOption.indian.rawValue.lowercased())
        suggestions.append(CuisineOption.amrican.rawValue.lowercased())
        suggestions.append(CuisineOption.japanese.rawValue.lowercased())
        suggestions.append(CuisineOption.italian.rawValue.lowercased())
        
        return suggestions
    }
}

struct SearchableBootCamp: View {
    
    @StateObject private var viewModel = SearchableBootCampViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.isSearching ? viewModel.filterRestaurants : viewModel.allRestaurants) { restaurant in
                    NavigationLink(value: restaurant) {
                        restaurantsRow(restaurant: restaurant )
                    }
                }
            }
            .padding()
        }
        .searchable(text: $viewModel.searchText, placement: .automatic, prompt: Text("Search Restaurants..."))
        .searchScopes($viewModel.searchScope, scopes: {
            ForEach(viewModel.allSearchScope, id: \.self) { scope in
                Text(scope.title)
                    .tag(scope)
            }
        })
        .searchSuggestions({
            ForEach(viewModel.getSearchSuggestions(), id: \.self) { suggestion in
                Text(suggestion)
                    .searchCompletion(suggestion)
            }
        })
        .navigationTitle("Restaurants List")
        .task {
            await  viewModel.loadRestaurants()
        }
        .navigationDestination(for: Restaurant.self) { restaurant in
            Text(restaurant.title.uppercased())
        }
    }
    
    private func restaurantsRow(restaurant: Restaurant) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.title)
                .font(.headline)
                .foregroundStyle(.black)
            Text(restaurant.cuisine.rawValue.capitalized)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.05))
        .cornerRadius(20)
    }
}

#Preview {
    NavigationStack {
        SearchableBootCamp()
    }
}
