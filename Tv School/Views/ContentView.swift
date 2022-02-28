//
//  ContentView.swift
//  Tv School
//
//  Created by sergio shaon on 22/2/22.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    @State private var stateOfFrontCard = CGSize.zero
    @State private var showExpandedCard = false
    @State private var bottomCardState = CGSize.zero
    @State private var ringValue: CGFloat = 0.8
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            titleView
                .blur(radius: show ? 20 : 0)
                .opacity(showExpandedCard ? 0.3 : 1)
                .offset(x: 0, y: showExpandedCard ? -200 : 0)
                .animation(Animation.default.delay(0.02), value: UUID())
            CardStackView(yOffsetValue: -40, backgroundColor: Color("card4"), showCard: $showExpandedCard)
                .scaleEffect(showExpandedCard ? 1.06 : 1.09)
                .offset(x: stateOfFrontCard.width, y: stateOfFrontCard.height)
                .offset(y: showExpandedCard ? -180 : 0)
                .modifier(CardStackViewModifier(rotationAngle: .degrees(show ? 0 : 10), yOffset: show ? -200 : 0, showCard: $showExpandedCard))
                .rotationEffect(.degrees(showExpandedCard ? -10 : 0))
                .animation(Animation.easeInOut, value: UUID())
            CardStackView(yOffsetValue: -20, backgroundColor: Color("card3"), showCard: $showExpandedCard)
                .scaleEffect(showExpandedCard ? 1.07 : 1.08)
                .offset(x: stateOfFrontCard.width, y: stateOfFrontCard.height)
                .offset(y: showExpandedCard ? -140 : 0)
                .modifier(CardStackViewModifier(rotationAngle: .degrees( show ? 0 : 5 ), yOffset: show ? -100 : 0, showCard: $showExpandedCard))
                .rotationEffect(.degrees(showExpandedCard ? -5 : 0))
                .animation(Animation.easeInOut, value: UUID())
            CardView(showCard: $showExpandedCard)
                .offset(x: stateOfFrontCard.width, y: stateOfFrontCard.height)
                .offset(y: showExpandedCard ? -100 : 0)
                .animation(Animation.spring(response: 0.3, dampingFraction: 0.5), value: UUID())
                .shadow(radius: 20)
                .onTapGesture {
                    self.showExpandedCard.toggle()
                }
                .gesture(drag)
            bottomCardView
                .blur(radius: show ? 20 : 0)
                .offset(y: bottomCardState.height)
                .animation(Animation.timingCurve(0.09, 0.88, 0.85, 0.41, duration: 0.2), value: UUID())
                .gesture(bottomCardDrag)
            
        }
    }
    var bottomCardDrag: some Gesture{
        DragGesture()
            .onChanged{ value in
                bottomCardState = value.translation
            }
            .onEnded{ value in
                if bottomCardState.height > 50 {
                    showExpandedCard.toggle()
                }
                if bottomCardState.height < -100 {
                    withAnimation {
                        bottomCardState.height = -280
                    }
                }else{
                    withAnimation {
                        bottomCardState = .zero
                    }
                }
                
            }
    }
    var drag: some Gesture{
        DragGesture()
            .onChanged{ value in
                stateOfFrontCard = value.translation
                self.show = true
                
            }
            .onEnded{ value in
                stateOfFrontCard = .zero
                self.show = false
            }
    }
    var titleView: some View{
        VStack{
            HStack{
                Text("Certificates")
                    .font(.title)
                    .bold()
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)

                }
            }
            .padding(.horizontal, 10)
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
            HStack(spacing: 10) {
                RingView(width: 90, height: 90, percentage: "78%", show: $ringValue)
                    .animation(Animation.easeInOut.delay(0.3), value: UUID())
                VStack(alignment: .leading, spacing: 7){
                    Text("SwiftUI")
                        .bold()
                    Text("8 of 10 sections have completed\n8 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 10)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background()
        .cornerRadius(35)
        .shadow(radius: 20)
        .offset(x: 0, y: showExpandedCard ? 350 : 1000)
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
    @Binding var showCard: Bool
    
    var body: some View{
        VStack{
            
        }
        .frame(width: showCard ? 350 : 300, height: 220)
        .background(backgroundColor)
        .cornerRadius(25)
        .shadow(radius: 20)
        .offset(x: 0, y: yOffsetValue)
    }
}
