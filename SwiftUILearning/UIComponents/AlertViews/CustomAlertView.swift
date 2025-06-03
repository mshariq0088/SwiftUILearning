//
//  CustomAlertView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 03/06/25.
//

import SwiftUI

struct CustomAlertView: View {
    @State var showAlert = false
    @State var backgroundColor: Color = .orange
    @State var alertType: ALertType? = nil
    
    enum ALertType {
        case error
        case success
    }
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Error Button") {
                    alertType = .error
                    showAlert.toggle()
                }
                
                Button("Success Button") {
                    alertType = .success
                    showAlert.toggle()
                }
            }
            
            .alert(isPresented: $showAlert) {
               getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error"))
        case .success:
            return Alert(title: Text("This was a successful!"), message: nil, dismissButton: .default(Text("OK"), action: {
                backgroundColor = .gray
            }))
        case nil:
            return Alert(title: Text("Error"))
        }
    }
}

#Preview {
    CustomAlertView()
}
