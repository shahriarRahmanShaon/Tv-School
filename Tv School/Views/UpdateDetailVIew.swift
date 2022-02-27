//
//  UpdateDetailVIew.swift
//  Tv School
//
//  Created by sergio shaon on 27/2/22.
//

import SwiftUI

struct UpdateDetailVIew: View {
    let itemContent: UpdateListModel
    
    var body: some View {
        VStack{
            Image(itemContent.image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            Text(itemContent.text)
        }
        .navigationBarTitle(itemContent.title)
    }
}

struct UpdateDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailVIew(itemContent: UpdateListModel())
    }
}
