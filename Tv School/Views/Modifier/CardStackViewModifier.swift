//
//  CardStackViewModifier.swift
//  Tv School
//
//  Created by sergio shaon on 24/2/22.
//

import SwiftUI

struct CardStackViewModifier: ViewModifier{
    var rotationAngle: Angle = .degrees(10)
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(rotationAngle)
            .rotation3DEffect(rotationAngle, axis: (x: 10, y: 0, z: 0))
            .blendMode(.hardLight)
    }
}
