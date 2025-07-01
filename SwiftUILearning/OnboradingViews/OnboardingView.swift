//
//  OnboardingView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/07/25.
//

import SwiftUI

// Onboading States:
/*
 0 - Welcome Screen
 1 - Add Name
 2 - Add Age
 3 - Add Gender
 */

struct OnboardingView: View {
    
    @State var onBoardingState: Int = 0
    
    // onboarding input
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for the alert
    @State var alertTItle: String = ""
    @State var showALert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    var body: some View {
        ZStack {
            
            // Content Layer
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(.green)
                }
            }
            
            // Button Layer
            VStack {
                Spacer()
                signInButton
            }
            .padding(30)
            .alert(isPresented: $showALert, content: {
                return Alert(title: Text(alertTItle))
            })
        }
    }
}

#Preview {
    OnboardingView()
        .background(Color.purple)
}


// MARK: - Components
extension OnboardingView {
    
    private var signInButton: some View {
        Text(onBoardingState == 0 ? "SIGN UP" :
                onBoardingState == 3 ? "FINISH" :
                "NEXT"
             
        )
            .font(.headline)
            .foregroundStyle(Color.black)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(30)
            .animation(nil)
            .onTapGesture {
                handleNextButtonTap()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("Find Your match..")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(.white)
                    , alignment: .bottom
                )
            
            Text("This is the #1 app for finding your perfect match online! In this tutorial we are practicing using appStorage and other swiftUI techniques.")
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center )
        .padding(30)
    }
    
  
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            TextField("Add your name here ...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(20)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Slider(value:  $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Transgender").tag("Transgender")
            } label: {
                Text("Select Gender")
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(20)
            }
            .pickerStyle(.menu)
            .accentColor(.white)
           
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: - Functions
extension OnboardingView {
    
    func handleNextButtonTap() {
        
        // CHECK INPUTS
        
        switch onBoardingState {
        case 1:
            guard name.count >= 3 else {
                // SHOW ALERT
                showAlert(title: "Your name must be at least 3 character long!")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward!")
                return
            }
        default:
            break
        }
        
        //  GO TO NEXT SCREEN
        if onBoardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
        
    }
    
    func showAlert(title: String) {
        alertTItle = title
        showALert.toggle()
    }
}
