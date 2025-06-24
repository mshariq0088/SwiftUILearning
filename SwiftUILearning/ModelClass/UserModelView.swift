//
//  UserModelView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 24/06/25.
//

import SwiftUI

struct UserDataModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followers: Int
    let isVerified: Bool
}

struct UserModelView: View {
    
    @State var userData: [UserDataModel] = [
        UserDataModel(displayName: "Nick", userName: "nick123", followers: 1000, isVerified: true),
        UserDataModel(displayName: "Emily", userName: "itsemily123", followers: 200, isVerified: false),
        UserDataModel(displayName: "Samantha", userName: "samantha007", followers: 700, isVerified: true),
        UserDataModel(displayName: "John", userName: "john223", followers: 500, isVerified: false)
    ]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userData) { user in
                    HStack(spacing: 15.0) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                            
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.blue)
                        } else {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundStyle(.red)
                        }
                        
                        VStack {
                            Text("\(user.followers)")
                                .font(.headline)
                            Text("Followers")
                                .font(.caption)
                                .foregroundStyle(.gray )
                        }
                    }
                    .padding(.vertical, 10)

                }
                .listStyle(.grouped)
            }
            .navigationTitle("User List")
        }
        
    }
}

#Preview {
    UserModelView()
}
