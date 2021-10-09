//
//  QuizView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct QuizView: View {

    @State var question1 =
        Question(
            number: 1,
            state: false,
            questionText: "Укажите основной уровень занятости",
            responseMessages: ["учащийся", "работающий", "бизнесмен/работаю на себя"]
        )

    @State var question2 =
        Question(
            number: 2,
            state: false,
            questionText: "Укажите уровень образования",
            responseMessages: ["учащийся", "работающий", "бизнесмен/работаю на себя"]
        )



    @State var counter = 0

    var body: some View {

        VStack {

            OnceQuestion(question: question1)
            
            OnceQuestion(question: question2)
            //SliderView()questions
        }

    }

}

struct QuizView_Previews: PreviewProvider {

    static var previews: some View {
        QuizView()
    }

}

private struct SliderView: View {

    @State private var valueSlider: Double = 23

    var body: some View {
        VStack {
            if (valueSlider > 23 && valueSlider <= 30) {
                Text("\(Int(valueSlider * 1000))")
                Text("Хватит на сырок")
            } else if (valueSlider > 30 && valueSlider <= 65) {
                Text("\(Int(valueSlider * 1000))")
                Text("Жигули в ипотеку")
            } else if (valueSlider > 65) {
                Text("\(Int(valueSlider * 1000))")
                Text("Покупаю на сдачу квартиру")
            } else {
                Text("\(Int(valueSlider * 1000))")
            }
            Slider(value: $valueSlider, in: 0...100)
        }
    }
}

private struct RadioButton: View {
    @Binding var checked: Bool    //the variable that determines if its checked
     var text: String

    var body: some View {
        HStack {
            Group{
                if checked {
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 8, height: 8)
                    }.onTapGesture {self.checked = false}
                } else {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                        .onTapGesture {self.checked = true}
                }
            }
            Text("\(text)")
        }
    }
}

private struct OnceQuestion: View {

    var question: Question
    @State var state = false

    var body: some View {

        VStack {
            Text(question.questionText)

            RadioButton(checked: $state, text: question.responseMessages[0])
            RadioButton(checked: $state, text: question.responseMessages[1])
            RadioButton(checked: $state, text: question.responseMessages[2])

        }

    }

}

