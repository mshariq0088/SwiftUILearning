//
//  ObservableMacroBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 26/07/25.
//

import SwiftUI

actor TitleDataBase {
    func getNewTitle() -> String {
        "Welcome to the SwfiftUI learning"
    }
}

 @Observable class ObservableMacroBootCampViewModel {
     
   @ObservationIgnored let database = TitleDataBase()
    @MainActor var title: String = "Starting Title"
    
//    func getTitle() {
//        Task { @MainActor in
//            title = await database.getNewTitle()
//        }
//    }
     
     func updateTitle() async {
         let title = await database.getNewTitle()
         
         await MainActor.run {
             self.title = title
         }
     }
}

struct ObservableMacroBootCamp: View {
    
    @State private var viewModel = ObservableMacroBootCampViewModel()
    
    var body: some View {
        Text(viewModel.title)
//            .onAppear {
//                viewModel.getTitle()
//            }
        
            .task {
                await viewModel.updateTitle()
            }
    }
}

#Preview {
    ObservableMacroBootCamp()
}
