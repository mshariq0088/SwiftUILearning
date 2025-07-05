//
//  ContentUnavailableView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct UnavailableContentView: View {
    var body: some View {
       // ContentUnavailableView.search
        ContentUnavailableView("No Internet Connection",
                               systemImage: "wifi.slash",
                               description: Text("Please connect to the internet and try again"))

    }
}

#Preview {
    UnavailableContentView()
}
