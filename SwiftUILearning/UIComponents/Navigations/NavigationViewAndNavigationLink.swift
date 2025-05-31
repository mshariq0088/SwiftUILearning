//
//  NavigationViewAndNavigationLink.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 31/05/25.
//

import SwiftUI

struct NavigationViewAndNavigationLink: View {
    @State var itemList: [String] = [
        "1.Goku", "2.Novita", "3.Patati", "4.Catgir"
    ]
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(itemList, id: \.self) { item in
                    Text(item)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                
            }
            .navigationTitle("All Items")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                leading: Image(systemName: "person.fill"),
                trailing: NavigationLink(destination: {
                    detailView()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                })
                .accentColor(.black)
            )
        }
        
    }
}

struct detailView: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(showsIndicators: false) {
                    Text("Goku")
                        .font(.largeTitle)
                        .underline()
                    Image("goku")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Novita")
                        .font(.largeTitle)
                        .underline()
                    Image("novita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Patati")
                        .font(.largeTitle)
                        .underline()
                    Image("patati")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    Text("Catgir")
                        .font(.largeTitle)
                        .underline()
                    Image("catgir")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                }
                
            }
        }
    }
}

#Preview {
    NavigationViewAndNavigationLink()
}
