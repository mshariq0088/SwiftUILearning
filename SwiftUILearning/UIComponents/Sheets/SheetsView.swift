//
//  SheetsView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 29/05/25.
//

import SwiftUI

struct SheetsView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
           
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Open Sheet")
                    .foregroundStyle(Color.white)
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
            })
            .sheet(isPresented: $showSheet) {
               ImageView()
            }
//            .fullScreenCover(isPresented: $showSheet) {
//                ImageView()
//            }
        }
    }
}

struct ImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                        presentationMode.wrappedValue.dismiss()
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
    SheetsView()
}
