//
//  CardView.swift
//  Tv School
//
//  Created by sergio shaon on 24/2/22.
//

import SwiftUI

struct CardView: View {
    var logoName = "Logo1"
    var imageName = "Card1"
    var backgroundColorName: Color = .black
    @Binding var showCard: Bool
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("iOS Development")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image(logoName)
            }.padding()
            Spacer()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .background(backgroundColorName)
        .frame(width: showCard ? 380 : 340, height: 220)
        .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(showCard: .constant(true))
    }
}
