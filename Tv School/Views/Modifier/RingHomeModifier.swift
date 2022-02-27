//
//  RingHomeModifier.swift
//  Tv School
//
//  Created by sergio shaon on 28/2/22.
//

import SwiftUI

struct RingHomeModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

