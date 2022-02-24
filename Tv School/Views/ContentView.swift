//
//  ContentView.swift
//  Tv School
//
//  Created by sergio shaon on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            titleView
            CardStackView(yOffsetValue: -40, backgroundColor: Color("card4"))
                .scaleEffect(1.06)
                .modifier(CardStackViewModifier(rotationAngle: .degrees(10)))
            CardStackView(yOffsetValue: -20, backgroundColor: Color("card3"))
                .scaleEffect(1.05)
                .modifier(CardStackViewModifier(rotationAngle: .degrees(5)))
            CardView()
                .shadow(radius: 20)
            bottomCardView
        }
    }
    var titleView: some View{
        VStack{
            HStack{
                Text("Certificates")
                    .font(.title)
                    .bold()
                Spacer()
            }.padding(.horizontal, 10)
            Image("Background1")
            Spacer()
        }
    }
    var bottomCardView: some View{
        VStack(spacing: 30){
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 50, height: 5)
                .opacity(0.2)
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background()
        .cornerRadius(35)
        .shadow(radius: 20)
        .offset(x: 0, y: 525)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardStackView: View {
    var yOffsetValue: CGFloat = 30
    var backgroundColor: Color = .blue
    
    var body: some View{
        VStack{
            
        }
        .frame(width: 300, height: 220)
        .background(backgroundColor)
        .cornerRadius(25)
        .shadow(radius: 20)
        .offset(x: 0, y: yOffsetValue)
    }
}
