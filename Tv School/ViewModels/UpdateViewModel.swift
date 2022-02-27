//
//  UpdateViewModel.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import Foundation

class UpdateViewModel: ObservableObject {
    @Published var update: [UpdateListModel] = updateListdummy
    
    //MARK: intent
    func addUpdate(){
        update.append(UpdateListModel())
    }
    
}

var updateListdummy = [
    UpdateListModel(title: "Combine", image: "Card2"),
    UpdateListModel(title: "Alarmofire",image: "Card3"),
    UpdateListModel(title: "Publisher",image: "Card4"),
    UpdateListModel(title: "UI design",image: "Card1"),
    UpdateListModel(title: "Grid layout",image: "Card5")
]
