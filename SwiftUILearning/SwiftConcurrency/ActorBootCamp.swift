//
//  ActorBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 16/07/25.
//

// TARGET LEARNING
// 1. What is the problem that actor are solving?
// 2. How was this problem solved prior to actor?
// 3. Actor can solve the problem

import SwiftUI

class MyDataManager {
    static let instance = MyDataManager()
    private init() { }
    
    var data: [String] = []
    
    private let lock = DispatchQueue(label: "com.MyApp.MyDataManager")
    
    func getRandomData(completionHandler: @escaping(_ title: String?) -> ())  {
        
        lock.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completionHandler(self.data.randomElement())
        }
    }
}


actor MyActorDataManager {
    static let instance = MyActorDataManager()
    private init() { }
    
    var data: [String] = []
    nonisolated let randomText = "sjkhkljhdfjhdDS"
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
    
    nonisolated func getData() -> String {
        return "New Data"
    }
}


struct HomeView: View {
    
//    let manager = MyDataManager.instance
    let manager = MyActorDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.4).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        
        .onAppear {
            let data = manager.randomText
        }
        
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
            
//            DispatchQueue.global(qos: .background) .async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
            
//            if let data = manager.getRandomData() {
//                self.text = data
//            }
        }
    }
}

struct SearchView: View {
    
    //let manager = MyDataManager.instance
    let manager = MyActorDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.4).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
            
//            DispatchQueue.global(qos: .default) .async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
            
//            if let data = manager.getRandomData() {
//                self.text = data
//            }
        }
    }
}

struct ActorBootCamp: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ActorBootCamp()
}
