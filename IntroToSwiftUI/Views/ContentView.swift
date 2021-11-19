//
//  ContentView.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 18.11.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        LandmarkList()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData()) //If we have environment object we had to add to contentview.
    }
}
