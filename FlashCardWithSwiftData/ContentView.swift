//
//  ContentView.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var flashCards: [FlashCardModel]
    
    @State private var showAddSheet: Bool = false
    @State private var showEditSheet: Bool = false
    @State private var selectedFlashCard: FlashCardModel? = nil
    var body: some View {
        VStack{
            List{
                ForEach(flashCards){ flashCard in
                    VStack(alignment: .leading){
                        Text("Question: \(flashCard.question)")
                            .font(.caption)

                        Text("Answer: \(flashCard.answer)")
                            .font(.headline)
                    }
                    .lineLimit(1)
                    .swipeActions(allowsFullSwipe: false){
                        Button(role: .cancel) {
                            selectedFlashCard = flashCard
                            showEditSheet = true
                        } label: {
                            Image(systemName: "pencil")
                        }.tint(Color.blue)
                        
                        Button(role: .destructive) {
                            deleteCard(card: flashCard)
                        } label: {
                            Image(systemName: "trash")
                        }


                    }
                }
                
            }
            NavigationLink {
                FlashCardView(flashCards: flashCards)
            } label: {
                Text("Play")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(item: $selectedFlashCard, content: { flashCard in
            EditFlashCardView(flashCard: flashCard)
        })
        .sheet(isPresented: $showAddSheet, content: {
            AddFlashCardView()
        })
        .navigationTitle("List of flash card")
    }
    func addCard(question: String, answer: String){
        let newCard = FlashCardModel(question: question, answer: answer)
        context.insert(newCard)
    }
    func deleteCard(card: FlashCardModel){
        context.delete(card)
    }
    func editCard(card: FlashCardModel, question: String, answer: String){
        card.question = question
        card.answer = answer
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
