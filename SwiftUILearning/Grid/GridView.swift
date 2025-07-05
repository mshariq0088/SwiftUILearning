//
//  GridView.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 05/07/25.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            ForEach(0..<4) { rowIndex in
                GridRow {
                    ForEach(0..<4) { columIndex in
                        let cellNumber = (rowIndex * 4) + (columIndex + 1)
                        
                        if cellNumber == 7 {
                            Color.clear
                                .gridCellUnsizedAxes([.horizontal, .vertical])
                        } else {
                            cell(int: cellNumber)
                                .gridCellColumns(1 )
                        }
                    }
                }
            }
        }
    }
    
    private func cell(int: Int) -> some View {
        Text("\(int)")
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
    }
}

#Preview {
    GridView()
}
