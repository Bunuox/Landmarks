//
//  IntroToSwiftUIApp.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 18.11.2021.
//

import SwiftUI

@main
struct IntroToSwiftUIApp: App {
    let persistenceController = PersistenceController.shared
    
    //https://developer.apple.com/tutorials/swiftui/handling-user-input (5 of 7)
    //If we use this property for a once in a lifetime.
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(modelData)
        }
    }
}
