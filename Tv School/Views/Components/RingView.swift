//
//  RingView.swift
//  Tv School
//
//  Created by sergio shaon on 28/2/22.
//

import SwiftUI

struct RingView: View {
    var width: CGFloat = 45
    var height: CGFloat = 45
    var percentage = "83%"
    @Binding var show: CGFloat
    var gradient = Gradient(colors: [
        .blue, .purple
    ])
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 7))
                .foregroundColor(.black.opacity(0.1))
                .frame(width: width, height: width)
            Circle()
                .trim(from: show, to: 1)
                .stroke(LinearGradient(gradient: gradient, startPoint: .topTrailing, endPoint: .bottomLeading) , style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                .frame(width: width, height: height)
                .rotationEffect(.degrees(180))
                .shadow(color: .purple.opacity(0.4), radius: 5, x: 0, y: 3)
            Text(percentage)
                .font(.subheadline)
                .bold()
                .onTapGesture {
                    withAnimation {
                        show -= 0.1
                    }
                }
        }
        
    }
}

