//
//  EditFlashCardView.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import SwiftUI

struct EditFlashCardView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showAlert: Bool = false
    let flashCard: FlashCardModel
    
    
    var body: some View {
        Form{
            Text("Enter question")
                .font(.headline)
            TextField("Enter question", text: $question)
            
            Text("Enter answer")
                .font(.headline)
            TextField("Enter answer", text: $answer)
            
            
        }
        VStack(alignment: .center) {
            Button {
                edit()
            } label: {
                Text("Update")
                    .frame(width: 100, height: 45, alignment: .center)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        }

        .alert("Error while adding card", isPresented: $showAlert) {
            Button("OK", role: .cancel){}
        } message: {
            Text("Please enter both question and answer.")
        }
        .onAppear(perform: {
            self.question = flashCard.question
            self.answer = flashCard.answer
        })

    }
    
    func validate() -> Bool{
        if question == "" || answer == ""{
            return false
        }
        return true
    }
    
    func edit(){
        if validate(){
            flashCard.question = question
            flashCard.answer = answer
            dismiss()
        }
        else{
            showAlert = true
        }
    }
}

#Preview {
    EditFlashCardView(flashCard: FlashCardModel(question: "", answer: ""))
}
