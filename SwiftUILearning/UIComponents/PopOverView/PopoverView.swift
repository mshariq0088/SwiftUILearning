//
//  PopoverView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 29/05/25.
//

//Sheet
//Transitions
//Animation

import SwiftUI

struct PopoverView: View {
    
    @State var showScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    showScreen.toggle()
                }, label: {
                    Text("Pop")
                        .foregroundStyle(Color.black)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                })

                Spacer()
            }
            // METHOD - 1 : Sheet Present
//            .sheet(isPresented: $showScreen) {
//                NewScreen()
//            }
            
            
            // METHOD - 2 : Transition View
//            ZStack {
//                if showScreen {
//                    NewScreen(showNewScreen: $showScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)
            
            // METHOD - 3 : Animation
            NewScreen(showNewScreen: $showScreen)
                .padding(.top, 100)
                .offset(y: showScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            Image("goku")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            VStack {
                HStack {
                    Button(action: {
                        //For Present Sheet
                        //presentationMode.wrappedValue.dismiss()
                        
                        // For Transition
                        showNewScreen.toggle()
                    }, label: {
                       Image(systemName: "xmark.app.fill")
                            .foregroundStyle(Color.white)
                            .font(.largeTitle)
                            .padding(20)
                            
                    })
                    Spacer()
                }
                Spacer()
            }
        }

    }
}

#Preview {
    PopoverView()
}
