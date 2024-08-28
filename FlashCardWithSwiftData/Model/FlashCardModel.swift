//
//  FlashCardModel.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import Foundation
import SwiftData

@Model
final class FlashCardModel: Identifiable{
    var id: String
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.id = UUID().uuidString
        self.question = question
        self.answer = answer
    }
}
