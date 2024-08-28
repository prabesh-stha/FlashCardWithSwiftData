//
//  FlashCardWithSwiftDataApp.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import SwiftUI
import SwiftData

@main
struct FlashCardWithSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
                    .modelContainer(for: FlashCardModel.self)
            }
        }
    }
}
