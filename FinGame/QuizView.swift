//
//  QuizView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

enum Qusetion {
    case one
    case two
    case three
    case empty
}

struct QuizView: View {

    var body: some View {

        ScrollView {
            Text("Расскажи о себе")
                .font(.largeTitle)
                .padding(.bottom)

            OnceQuestion(
                questionTitle: "Ты работоешь?",
                image1: "portfel",
                answer1: "Я - работяга",
                image2: "monitor",
                answer2: "Я учусь",
                image3: "crown",
                answer3: "Я бизнесмен"
            )

            DividerView().padding(.vertical, 24)

            SliderView().padding(.horizontal, 24)

            DividerView().padding(.vertical, 24)

            OnceQuestion(
                questionTitle: "Какое у тебя образование?",
                image1: "hat",
                answer1: "Высшее",
                image2: "medal",
                answer2: "Среднее",
                image3: "cash",
                answer3: "Ушёл в бизнес после 9 класса"
            )

            NavigationLink(destination: InstructionView()) {
                Text("Далее")
                    .font(.title2)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 48)
                    .background(Color("blueMain"))
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }.padding(.vertical, 48)

            
            Spacer()
        }

    }

}

struct QuizView_Previews: PreviewProvider {

    static var previews: some View {
        QuizView()
    }

}

private struct SliderView: View {

    @State private var valueSlider: Double = 0

    var body: some View {
        VStack {
            Text("Сколько ты зарабатываешь?")
                .font(.title2)
                .padding(.bottom, 24)


            Text("\(Int(valueSlider * 1000)) ₽")
                .font(.title)


            VStack {
                if (valueSlider >= 0 && valueSlider <= 10) {
                    Text("Не хватит на сырок")
                        .font(.title2)
                } else if (valueSlider > 10 && valueSlider <= 30) {
                    Text("Хватит на сырок")
                        .font(.title2)
                } else if (valueSlider > 30 && valueSlider <= 65) {
                    Text("Жигули в ипотеку")
                        .font(.title2)
                } else if (valueSlider > 65) {
                    Text("Покупаю на сдачу квартиру")
                        .font(.title2)
                }
                Slider(value: $valueSlider, in: 0...100)
            }
        }
    }
}

struct OnceQuestion: View {
    @State var answer = Qusetion.empty

    var questionTitle: String

    var image1: String
    var answer1: String

    var image2: String
    var answer2: String

    var image3: String
    var answer3: String

    var body: some View {
        VStack {
            Text("\(questionTitle)")
                .font(.title2)
                .padding(.bottom, 24)

            VStack(spacing: 16) {
                Button(action: {
                    answer = .one
                }, label: {
                    HStack {
                        Image("\(image1)")
                            .padding(.trailing, 20)
                        Text("\(answer1)")
                            .foregroundColor(.black)

                        Spacer()
                    }.padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(answer == .one ? Color("grayBackgroundChoose"): Color("grayBackground"))
                        .cornerRadius(8)
                }).padding(.horizontal, 24)

                Button(action: {
                    answer = .two
                }, label: {
                    HStack {
                        Image("\(image2)")
                            .padding(.trailing, 20)
                        Text("\(answer2)")
                            .foregroundColor(.black)

                        Spacer()
                    }.padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(answer == .two ? Color("grayBackgroundChoose"): Color("grayBackground"))
                        .cornerRadius(8)
                }).padding(.horizontal, 24)

                Button(action: {
                    answer = .three
                }, label: {
                    HStack {
                        Image("\(image3)")
                            .padding(.trailing, 20)
                        Text("\(answer3)")
                            .foregroundColor(.black)

                        Spacer()
                    }.padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(answer == .three ? Color("grayBackgroundChoose"): Color("grayBackground"))
                        .cornerRadius(8)
                }).padding(.horizontal, 24)
            }
        }
    }
}


// old

//private struct RadioButton: View {
//    @Binding var checked: Bool    //the variable that determines if its checked
//     var text: String
//
//    var body: some View {
//        HStack {
//            Group{
//                if checked {
//                    ZStack{
//                        Circle()
//                            .fill(Color.blue)
//                            .frame(width: 20, height: 20)
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 8, height: 8)
//                    }.onTapGesture {self.checked = false}
//                } else {
//                    Circle()
//                        .fill(Color.white)
//                        .frame(width: 20, height: 20)
//                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
//                        .onTapGesture {self.checked = true}
//                }
//            }
//            Text("\(text)")
//        }
//    }
//}

//private struct SomeOnceQuestion: View {
//
//    var question: Question
//    @State var state = false
//
//    var body: some View {
//
//        VStack {
//            Text(question.questionText)
//
//            RadioButton(checked: $state, text: question.responseMessages[0])
//            RadioButton(checked: $state, text: question.responseMessages[1])
//            RadioButton(checked: $state, text: question.responseMessages[2])
//
//        }
//
//    }
//
//}
