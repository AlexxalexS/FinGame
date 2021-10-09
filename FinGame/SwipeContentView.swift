//
//  SwipeContentView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title: String
    var notification: Bool?
    var notificationText: String?
    var card: Card
}

struct SwipeContentView: View {
    @State var fun = 0
    @State var social = 0
    @State var money = 0

    @State var question = [
        Question(
            title: "Как время проведем?",
            card: Card(
                image: "student1",
                rightSwipte: Card.Choose(fun: 5, social: 5, money: 0, text: "Остнанусь дома и посмотрю сериал"),
                leftSwipe: Card.Choose(fun: -5, social: 5, money: 0, text: "Пойду на пары")
            )
        ),
        Question(
            title: "На карточку упала стипендия, идем в кино с одногруппниками?",
            card: Card(
                image: "student2",
                rightSwipte: Card.Choose(fun: -5, social: -5, money: 5, text: "Нет"),
                leftSwipe: Card.Choose(fun: 10, social: +10, money: -5, text: "Да")
            )
        ),
        Question(
            title: "Лабу дашь списать?",
            card: Card(
                image: "student3",
                rightSwipte: Card.Choose(fun: 0, social: 5, money: 0, text: "Подскажу сайт с ответами"),
                leftSwipe: Card.Choose(fun: -5, social: -10, money: 10, text: "Решу за деньги")
            )
        )
    ]

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(fun: $fun, social: $social, money: $money)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)

            Spacer()

            ZStack {
                ForEach(question) { card in
                    VStack {

                        CardView(
                            card: card.card,
                            title: card.title,
                            fun: $fun,
                            social: $social,
                            money: $money
                        ).padding(.horizontal, 24)
                    }

                }
            }
        }
    }
}

struct SwipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeContentView()
    }
}

private struct CardView: View {

    @State var card: Card
    @State var title: String
    @State var isShow = true

    @Binding var fun: Int
    @Binding var social: Int
    @Binding var money: Int

    var body: some View {
        if isShow {
            VStack {
                VStack {
                    DividerView()

                    Spacer()

                    Text("\(title)")
                        .foregroundColor(Color("blueDark"))
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)

                    Spacer()

                    DividerView()


                }.padding(.bottom, 24)
                Spacer()
                ZStack {
                    Image(card.image)
                        .resizable()
                        .frame(width: 327, height: 460)

                    VStack {
                        Spacer()
                        HStack {
                            if card.x<0 {
                                Text("\(card.rightSwipte.text)")
                                    .padding(10)
                                    .background(Color.black.opacity(0.2))
                                    .padding(10)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(8)
                            }
                            if card.x>0 {
                                Text("\(card.leftSwipe.text)")
                                    .padding(10)
                                    .background(Color.black.opacity(0.2))
                                    .padding(10)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(8)
                            }

                        }
                    }
                }.cornerRadius(8)
                    .offset(x: card.x, y: card.y)
                    .rotationEffect(.init(degrees: card.degree))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    card.x = value.translation.width
                                    //card.y = value.translation.height
                                    card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                                }
                            }

                            .onEnded { value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                                    switch value.translation.width {
                                        case 0...100:
                                            card.x = 0; card.degree = 0; card.y = 0
                                        case let x where x > 100:
                                            card.x = 500; card.degree = 12
                                            isShow = false
                                            money += card.rightSwipte.money
                                            fun += card.rightSwipte.fun
                                            social += card.rightSwipte.social
                                        case (-100)...(-1):
                                            card.x = 0; card.degree = 0; card.y = 0;
                                        case let x where x < -100:
                                            card.x = -500; card.degree = -12
                                            isShow = false
                                            money += card.leftSwipe.money
                                            fun += card.leftSwipe.fun
                                            social += card.leftSwipe.social
                                        default: card.x = 0; card.y = 0;
                                    }
                                }
                            }
                )
            }.background(isShow ? Color.white : nil)
        }

    }

}

private struct HeaderView: View {

    @Binding var fun: Int
    @Binding var social: Int
    @Binding var money: Int

    var body: some View {
        HStack {
            HStack {
                Image("palm")
                Text("\(fun)")
                    .foregroundColor(.white)
                    .font(.title)
            }

            Spacer()

            HStack {
                Image("arms")
                Text("\(social)")
                    .foregroundColor(.white)
                    .font(.title)
            }


            Spacer()

            HStack {
                Image("money")
                Text("\(money)")
                    .foregroundColor(.white)
                    .font(.title)
            }
        }.padding(.horizontal, 16)
            .padding(.vertical, 21)
            .background(Color("blueMain"))
            .cornerRadius(8)
        

    }
}
