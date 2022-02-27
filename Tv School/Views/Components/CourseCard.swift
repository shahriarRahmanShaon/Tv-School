//
//  CourseCard.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct CourseCard: View {
    var model: CourseCardModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                Text(model.title)
                    .font(.title)
                    .bold()
                    .frame(width: 150, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(model.logo)
            }
            Text(model.text.uppercased())
            model.image
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 215)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 280, height: 280)
        .background(model.color)
        .cornerRadius(30)
        .shadow(color: model.color.opacity(0.8), radius: 15, y: 15)
        .overlay(
            Image(systemName: "play.fill")
                .font(.system(size: 25, weight: .bold, design: .default))
        )
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(model: CourseCardModel())
    }
}
