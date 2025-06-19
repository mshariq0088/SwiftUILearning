//
//  BottomTabView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 19/06/25.
//

import SwiftUI

struct BottomTabView: View {
    @State  var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTabView(selectedTab: $selectedTab)
            BrowseTabView()
            ProfileTabView()
        }
        .accentColor(.black)
    }
}

#Preview {
    BottomTabView()
}

struct HomeTabView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("HOME TAB")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                Button(action: {
                    selectedTab = 2
                }, label: {
                    Text("Go to Profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                })
            }
        }
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
        .tag(0)
    }
}

struct BrowseTabView: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            Text("BROWSE TAB")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
        .tabItem {
            Image(systemName: "globe")
            Text("Browse")
        }
        .tag(1)
    }
}

struct ProfileTabView: View {
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            Text("PROFILE TAB")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
        
        .tabItem {
            Image(systemName: "person.fill")
            Text("Profile")
        }
        .tag(2)
    }
}
