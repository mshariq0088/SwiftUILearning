//
//  DynamicActionSheetView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 04/06/25.
//

import SwiftUI

struct DynamicActionSheetView: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetAction: ActionSheetOptions = .isOtherPost
    @State var imageChange: Image = Image("goku")
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                Text("Tom Cruise")
                Spacer()
                Button(action:  {
                    actionSheetAction = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .accentColor(.black)
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
                .overlay {
                    imageChange
                        .resizable()
                }
        }
        .actionSheet(isPresented: $showActionSheet, content: openActionSheet)
    }
    
    func openActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // Add Action Code here
            imageChange = Image("patati")
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // Add Action Code here
            imageChange = Image("novita")
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            // Add Action Code here
            
        }
        
        let cancelButton: ActionSheet.Button = .cancel()
        
        let title = Text("What would you like to do With this image?")
        
        switch actionSheetAction {
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, cancelButton])
        case .isOtherPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton])
        }
            
    }
    
}

#Preview {
    DynamicActionSheetView()
}
