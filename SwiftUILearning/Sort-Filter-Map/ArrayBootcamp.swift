//
//  ArrayBootcamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 17/08/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let verified: Bool
}

class ArrayBootCampViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    
    init() {
      userData()
      filteredData()
    }
    
    func filteredData() {
        //Sorting
//        filterArray = dataArray.sorted { (user1, user2)  in
//            return user1.points > user2.points
//        }
        
        //filterArray = dataArray.sorted(by: { $0.points > $1.points })
        
        //Filter
        filterArray = dataArray.filter({ (user) in
//            return user.points < 30
            return user.verified
        })
    }
    
    func userData() {
        let user1 = UserModel(name: "Shariq", points: 10, verified: true)
        let user2 = UserModel(name: "Aamir", points: 7, verified: false)
        let user3 = UserModel(name: "Hashim", points: 50, verified: true)
        let user4 = UserModel(name: "Abid", points: 10, verified: false)
        let user5 = UserModel(name: "Danish", points: 30, verified: true)
        let user6 = UserModel(name: "Rehan", points: 40, verified: false)
        let user7 = UserModel(name: "Shumail", points: 20, verified: true)
        let user8 = UserModel(name: "Atif", points: 80, verified: false)
        let user9 = UserModel(name: "Arbaaz", points: 90, verified: true)
        let user10 = UserModel(name: "Azhar", points: 100, verified: false)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    
}

struct ArrayBootcamp: View {
    
    @StateObject  var vm = ArrayBootCampViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(vm.filterArray) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(item.points)")
                            Spacer()
                            if item.verified {
                                Image(systemName: "flame.fill")
                                    //.renderingMode(.original)
                                    .font(.title)
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    //.shadow(color: Color.green, radius: 20)
                    .padding(.horizontal)
                                
                }
            }
        }
    }
}

#Preview {
    ArrayBootcamp()
}
