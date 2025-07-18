//
//  SandableProtocolBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 18/07/25.
//

import SwiftUI

actor SandableProtocolDataManager {
    
    func updateDatabase(userInfo: MyUserInfo) {
        
    }
    
}

struct MyUserInfo: Sendable {
    let name: String
}

final class MyClassUserInfo: @unchecked Sendable {
    private var name: String
    let queue = DispatchQueue(label: "com.MyApp.MyClassUserInfo")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        queue.async {
            self.name = name
        }
    }
}

class SandableProtocolBootCampViewModel: ObservableObject {
    let manager = SandableProtocolDataManager()
    
    func updateCurrentUserInfo() async {
        
        let userInfo = MyUserInfo(name: "Nio")
       await manager.updateDatabase(userInfo: userInfo)
    }
}

struct SandableProtocolBootCamp: View {
    
    @StateObject private var vm = SandableProtocolBootCampViewModel()
    
    var body: some View {
       Text("Hello World!")
            .task {
               await vm.updateCurrentUserInfo()
            }
    }
}

#Preview {
    SandableProtocolBootCamp()
}
