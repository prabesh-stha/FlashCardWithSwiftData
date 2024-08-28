//
//  AddFlashCardView.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import SwiftUI

struct AddFlashCardView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var question: String = ""
    @State private var answer: String = ""
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        Form{
            Text("Enter question")
                .font(.headline)
            TextField("Enter question", text: $question, axis: .vertical)
            
            Text("Enter answer")
                .font(.headline)
            TextField("Enter answer", text: $answer)
            
            
        }
        VStack(alignment: .center) {
            Button {
                add()
            } label: {
                Text("Add")
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

    }
    
    func validate() -> Bool{
        if question == "" || answer == ""{
            return false
        }
        return true
    }
    
    func add(){
        if validate(){
            let newCard = FlashCardModel(question: question, answer: answer)
            context.insert(newCard)
            dismiss()
        }
        else{
            showAlert = true
        }
    }
}

#Preview {
    AddFlashCardView()
}
