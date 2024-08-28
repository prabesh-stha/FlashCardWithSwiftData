//
//  FlashCardView.swift
//  FlashCardWithSwiftData
//
//  Created by Prabesh Shrestha on 28/08/2024.
//

import SwiftUI

struct FlashCardView: View {
    let flashCards: [FlashCardModel]
    @State private var showAnswer: Bool = false
    @State private var isFlipped: Bool = false
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack {
            ZStack {
                Text(flashCards[currentIndex].answer)
                    .font(.largeTitle)
                    .frame(width: 350, height: 350, alignment: .center)
                    .background(Color.blue.opacity(0.4))
                    .cornerRadius(10)
                    .opacity(showAnswer ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0)
                    )

                Text(flashCards[currentIndex].question)
                    .font(.largeTitle)
                    .frame(width: 350, height: 350, alignment: .center)
                    .background(Color.blue.opacity(0.4))
                    .cornerRadius(10)
                    .opacity(showAnswer ? 0 : 1)
                    .rotation3DEffect(
                        .degrees(isFlipped ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
            .frame(width: 350, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                withAnimation(.bouncy(duration: 2, extraBounce: 0.1)) {
                    isFlipped.toggle()
                    showAnswer.toggle()
                }
            }

            HStack {
                Button {
                    if currentIndex != 0
                    {
                        isFlipped = false
                        showAnswer = false
                        decrementIndex()
                    }
                } label: {
                    Text("Previous")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                Button {
                    if currentIndex != flashCards.count - 1
                    {
                        isFlipped = false
                        showAnswer = false
                        incrementIndex()
                    }
                } label: {
                    Text("Next")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }

    func incrementIndex() {
        currentIndex = min(currentIndex + 1, flashCards.count - 1)
    }

    func decrementIndex() {
        currentIndex = max(currentIndex - 1, 0)
    }
}



#Preview {
    NavigationStack {
        FlashCardView(flashCards: [])
    }
}
