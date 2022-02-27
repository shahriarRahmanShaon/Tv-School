//
//  CourseCardModel.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import Foundation
import SwiftUI

struct CourseCardModel: Identifiable{
    
    var id = UUID()
    var title = "Prototype designs in swiftUI"
    var text = "18 sections"
    var logo = "Logo1"
    var image = Image("Card1")
    var color = Color("card1")
}
