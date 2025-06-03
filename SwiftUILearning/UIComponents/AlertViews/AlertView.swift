//
//  AlertView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 03/06/25.
//

import SwiftUI

struct AlertView: View {
    
    @State var showAlert = false
    @State var backgroundColor: Color = .yellow
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            Button("Show Alert View") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
              getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        return   Alert(
            title: Text("Alert"),
            message: Text("Email and Password is incorrect"),
            primaryButton: .destructive(Text("Change Color"), action: {
                backgroundColor = .green
            }),
            secondaryButton: .cancel())
            //Alert(title: Text("Show Alert"))
    }
}

#Preview {
    AlertView()
}
