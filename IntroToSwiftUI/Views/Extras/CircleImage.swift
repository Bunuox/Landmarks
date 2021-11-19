//
//  CircleImage.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 18.11.2021.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        if #available(iOS 15.0, *) {
            image
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 10)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
