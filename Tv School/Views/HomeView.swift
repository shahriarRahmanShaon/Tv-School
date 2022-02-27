//
//  HomeView.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showProfile = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
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
            MenuView()
                .offset(y: showProfile ? 0 : 600)
                .animation(Animation.spring(), value: UUID())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
