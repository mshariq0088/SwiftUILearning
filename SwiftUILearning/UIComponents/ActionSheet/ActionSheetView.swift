//
//  ActionSheetView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/06/25.
//

import SwiftUI

struct ActionSheetView: View {
    
    @State var showActionSheet: Bool = false
    @State var backgroundColor: Color = .purple
    
    var body: some View {
        
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            Button("Open Sheet") {
                showActionSheet.toggle()
            }
            .foregroundStyle(.black)
            .frame(width: 100, height: 50)
            .background(Color.white)
            .cornerRadius(20)
            .actionSheet(isPresented: $showActionSheet, content: openActionSheet)
        }
    }
    
    func openActionSheet() -> ActionSheet {
//        return ActionSheet(title: Text("Hello this is a action sheet!"))
        
        let button1: ActionSheet.Button = .default(Text("Open Camera"))
        let button2: ActionSheet.Button = .destructive(Text("Open Gallary"))
        let button3: ActionSheet.Button = .cancel(Text("Cancel"))
        let button4: ActionSheet.Button = .destructive(Text("Change Color")) {
            backgroundColor = .yellow
        }
        
        return ActionSheet(
            title: Text("Photo Album"),
            message: Text("Open Your Album"),
            buttons: [button1, button2, button3, button4])
    }
}

#Preview {
    ActionSheetView()
}
