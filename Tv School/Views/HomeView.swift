//
//  HomeView.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showProfile = false
    @State private var showCard = CGSize.zero
    let CourseCardDummydata = [
        CourseCardModel(),
        CourseCardModel(title: "Build a swiftUI app", text: "20 Sections", logo: "Logo1", image: Image("Card3"), color: Color("card3")),
        CourseCardModel()
    ]
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
            homeViewBackgroundCard
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(CourseCardDummydata) { item in
                        CourseCard(model: item)
                    }
                }
                .padding()
                .padding(.bottom, 30) // as it was cliping the shadows
            }
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 600)
                .offset(y: showCard.height)
                .animation(Animation.spring(), value: UUID())
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(drag)
        }
    }
    var homeViewBackgroundCard: some View{
        VStack {
            HStack{
                Text("Watching")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button {
                    self.showProfile.toggle()
                } label: {
                    Image("profile")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .background(.black)
                        .cornerRadius(50)
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 30)
            Spacer()
        }
        .padding(.top, 44)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 25)
        .offset(y: showProfile ? -450 : 0)
        .rotation3DEffect(.degrees(showProfile ? -10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
        .scaleEffect(showProfile ? 0.9 : 1)
        .animation(Animation.spring(), value: UUID())
        .edgesIgnoringSafeArea(.all)
    }
    var drag: some Gesture{
        DragGesture()
            .onChanged{ value in
                showCard = value.translation
            }
            .onEnded{ value in
                if showCard.height > 50{
                    showProfile.toggle()
                }
                showCard = .zero
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

