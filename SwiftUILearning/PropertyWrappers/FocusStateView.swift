//
//  FocusStateView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

struct FocusStateView: View {
    
    enum OnboardingFields: Hashable {
        case userName
        case password
    }
    
//    @FocusState private var userNameInFocus: Bool
    @State private var userName: String = ""
    
//    @FocusState private var passwordInFocus: Bool
    @State private var password: String = ""
    
    @FocusState private var fieldInFocus: OnboardingFields?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Enter user name...", text: $userName)
                .focused($fieldInFocus, equals: .userName)
//                .focused($userNameInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(30)
            
            SecureField("Enter password...", text: $password)
                .focused($fieldInFocus, equals: .password)
//                .focused($passwordInFocus)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(30)
            
          
            
            Button(action: {
                let usernameIsValid = !userName.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid {
                    print("Sign in")
                } else if usernameIsValid {
                    fieldInFocus = .password
//                    userNameInFocus = false
//                    passwordInFocus = true
                } else {
                    fieldInFocus = .userName
//                    userNameInFocus = true
//                    passwordInFocus = false
                }
            }, label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 55)
//                    .background(Color.black)
                    .cornerRadius(10)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.userNameInFocus = true
//            }
//        }
    }
    
}

#Preview {
    FocusStateView()
}
