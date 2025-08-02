//
//  LongPressGestureBootCamp.swift
//  SwiftUILearning
//
//  Created by Mohammad Shariq on 02/08/25.
//

import SwiftUI

struct LongPressGestureBootCamp: View {
    
    @State var isCompeleted: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isCompeleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                        //start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isCompeleted.toggle()
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isCompeleted = false
                                    }
                                }
                            }
                        }
                    } perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                
                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompeleted = false
                        isSuccess = false
                    }
                
            }
        }
        
        
        
        
        
        
        
        
        //        Text(isCompeleted ? "Long Press Success" : "Long Press Unsuccess")
        //            .padding()
        //            .padding(.horizontal)
        //            .background(isCompeleted ? Color.yellow : Color.gray)
        //            .cornerRadius(10)
        //
        //            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
        //                isCompeleted.toggle()
        //            }
        
    }
}

#Preview {
    LongPressGestureBootCamp()
}
