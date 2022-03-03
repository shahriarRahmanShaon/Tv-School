//
//  MenuView.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack{
            Spacer()
            MenuCard()
        }
        .padding(.bottom, 25)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
