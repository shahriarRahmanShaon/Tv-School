//
//  TabBarView.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Text("Home")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
