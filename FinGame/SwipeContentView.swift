//
//  SwipeContentView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct SwipeContentView: View {
    @State var fun = 0
    @State var social = 0
    @State var money = 0
    @State var conunter = 0

    @State var question = student1
    @State private var isShowingSheet = false

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(fun: $fun, social: $social, money: $money)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)

            Spacer()

            if conunter == question.count {
                Text("Ура ты выиграл")

                Text("Ты отличо справляешься!")

                Text("Переходи и попробуй демо-режим инвестора на сойте ВТБ").padding()
                Spacer()
            } else {
                ZStack {
                    ForEach(question.reversed()) { card in
                        VStack {
                            CardView(
                                card: card.card,
                                title: card.title,
                                fun: $fun,
                                social: $social,
                                money: $money,
                                counter: $conunter,
                                isShowingSheet: $isShowingSheet
                            ).padding(.horizontal, 24)
                        }.sheet(isPresented: $isShowingSheet) {
                            VStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 60, height: 3)

                                Text("\(card.title)")

                                    .padding(24)
                                    .font(.title3)

                                Spacer()
                            }.padding()
                        }

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
    @Binding var counter: Int
    @Binding var isShowingSheet: Bool

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
                            if card.x < 0 {
                                Text("\(card.rightSwipte.text)")
                                    .padding(10)
                                    .background(Color.black.opacity(0.6))
                                    .cornerRadius(10)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color.white)
                            }
                            if card.x > 0 {
                                Text("\(card.leftSwipe.text)")
                                    .padding(10)
                                    .background(Color.black.opacity(0.6))
                                    .cornerRadius(10)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color.white)
                            }

                        }
                    }
                }.cornerRadius(8)
                    .offset(x: card.x, y: card.y)
                    .rotationEffect(.init(degrees: card.degree))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.easeInOut(duration: 0.2)) {
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
                                        money += card.leftSwipe.money
                                        fun += card.leftSwipe.fun
                                        social += card.leftSwipe.social
                                        counter += 1
                                    case (-100)...(-1):
                                        card.x = 0; card.degree = 0; card.y = 0;
                                    case let x where x < -100:
                                        card.x = -500; card.degree = -12
                                        isShow = false
                                        money += card.rightSwipte.money
                                        fun += card.rightSwipte.fun
                                        social += card.rightSwipte.social
                                        counter += 1
                                    default: card.x = 0; card.y = 0;
                                    }
                                }
                            }
                    )
            }.background(isShow ? Color.white : nil)
                .overlay(
                    LampView(isShowingSheet: $isShowingSheet)
                )
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

private struct LampView: View {
    @Binding var isShowingSheet: Bool
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 46, height: 46)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 3)
                    Button(action: {
                        isShowingSheet.toggle()
                    }, label: {
                        Image("lamp")
                    })
                }.offset(x: 5, y: 10)
            }
        }
    }
}
