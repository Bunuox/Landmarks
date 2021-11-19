//
//  FavoriteButton.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 19.11.2021.
//

import SwiftUI

struct FavoriteButton: View {
    //Add an isSet binding that indicates the button’s current state, and provide a constant value for the preview.
    @Binding var isSet : Bool
    
    var body: some View {
        Button {
            self.isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star" )
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
