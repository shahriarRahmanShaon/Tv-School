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
    @State private var showUpdate = false
    @State private var isPresenting = false
    let CourseCardDummydata = [
        CourseCardModel(title: "Build a swiftUI app", text: "20 Sections", logo: "Logo1", image: Image("Card3"), color: Color("card3")),
        CourseCardModel(),
        CourseCardModel()
    ]
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
            homeViewBackgroundCard
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
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                HStack(spacing: 16){
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
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
                    }
                    Button {
                        showUpdate.toggle()
                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .frame(width: 35, height: 35)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 5)
                    }
                }
                .frame(height: 15)
                .padding(.horizontal, 10)
                .padding(.top, 30)
                .padding(.bottom, 40)
                .sheet(isPresented: $showUpdate) {
                    UpdateListView()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    RingWatchView()
                        .padding()
                        .padding(.bottom, 12)
                        .onTapGesture {
                            isPresenting.toggle()
                        }
                }
                .fullScreenCover(isPresented: $isPresenting, onDismiss: {
                    isPresenting = false
                }) {
                    ContentView()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(CourseCardDummydata) { item in
                            CourseCard(model: item)
                        }
                    }
                    .padding()
                    .padding(.bottom, 30) // as it was cliping the shadows
                }
                HStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding()
                CourseCard(model: CourseCardModel(), frameWidth: UIScreen.main.bounds.width - 60, frameHeight: 275)
            }
            .padding(.top, 44)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 25)
            .offset(y: showProfile ? -450 : 0)
            .rotation3DEffect(.degrees(showProfile ? -10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(Animation.spring(), value: UUID())
        }
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


struct RingWatchView: View {
    var body: some View {
        HStack{
            HStack(spacing: 10) {
                RingView(show: .constant(80))
                VStack(alignment: .leading, spacing: 5){
                    Text("5 minutes left")
                        .font(.subheadline)
                        .bold()
                    Text("Watched 10 minute today")
                        .font(.caption)
                }
            }
            .modifier(RingHomeModifier())
            HStack(spacing: 10) {
                RingView(show: .constant(80))
            }
            .modifier(RingHomeModifier())
            HStack(spacing: 10) {
                RingView(show: .constant(80))
            }
            .modifier(RingHomeModifier())
        }
    }
}
