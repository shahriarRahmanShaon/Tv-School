//
//  UpdateListModel.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import Foundation

struct UpdateListModel: Identifiable{
    
    var id = UUID()
    var text: String = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout"
    var title: String = "SwiftUI"
    var image: String = "Card1"
    var date: String = "Feb 27"
}
