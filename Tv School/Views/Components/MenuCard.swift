//
//  MenuView.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct MenuCard: View {
    var gradient = Gradient(colors: [
        Color.white,
        Color(#colorLiteral(red: 0.8954151273, green: 0.9160741568, blue: 0.9564130902, alpha: 1))
    ])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Sergio - 35% complete")
                .font(.caption)
            Color.white
                .frame(width: 40, height: 5)
                .cornerRadius(10)
                .frame(width: 130, height: 5, alignment: .leading)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding()
                .frame(width: 150, height: 25)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            MenuRow(title: "Account", icon: "gear")
            MenuRow(title: "Billing", icon: "creditcard")
            MenuRow(title: "Sign out", icon: "person.crop.circle")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 280)
        .background(.linearGradient(gradient, startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(radius: 30)
        .padding(.horizontal, 25)
        .overlay(
            Image("profile")
                .resizable()
                .frame(width: 60, height: 60)
                .background(.black)
                .cornerRadius(50)
                .offset(y: -145)
        )
    }
}

struct MenuCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuCard()
            
    }
}

struct MenuRow: View{
    var title: String
    var icon: String
    
    var body: some View{
        HStack(spacing: 16){
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .foregroundColor(Color(#colorLiteral(red: 0.7184271216, green: 0.7827915549, blue: 0.8638793826, alpha: 1) ))
            Text(title)
                .font(.system(size: 20, weight: .bold))
        }
    }
}
