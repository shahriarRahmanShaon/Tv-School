import Foundation
import SwiftUI

struct CourseListModel: Identifiable{
    var id = UUID()
    var title: String
    var subString: String
    var image: Image
    var logo: Image
    var color: Color
    var show: Bool
}

var courseData = [
    CourseListModel(title: "Prototyping in Swiftui", subString: "18 Sections", image: Image("Card5") , logo: Image("Logo1"), color: Color("card1"), show: false),
    CourseListModel(title: "Prototyping in Swiftui", subString: "18 Sections", image: Image("Card2") , logo: Image("Logo2"), color: Color("card2"), show: false),
    CourseListModel(title: "Prototyping in Swiftui", subString: "18 Sections", image: Image("Card3") , logo: Image("Logo3"), color: Color("card3"), show: false)

]
