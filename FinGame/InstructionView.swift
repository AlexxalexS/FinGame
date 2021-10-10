//
//  InstructionView.swift
//  FinGame
//
//  Created by Alexey on 10.10.2021.
//

import SwiftUI

struct InstructionView: View {

    @State var x = 0.0
    @State var y = 0.0
    @State var degree = 0.0

    @State var isShowingSheet = false
    var body: some View {
        VStack {
            HeaderView()
                .padding(.bottom, 16)

            DividerView()

            Text("Твоя цель - удержать баланс трёх показателей: настроя, общения и дохода (они расположены выше)")
                .foregroundColor(Color("blueDark"))
                .font(.title3)
                .multilineTextAlignment(.center)
                .lineLimit(20)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical, 16)

            DividerView()
                .padding(.bottom, 16)

            VStack {
                Text("Карточку можно смахивать вправо или влево, прямо как в Тиндере!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                Text("Но тут каждое твоё действие будет влиять на твои показатели, поэтому внимательно читай вопросы")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.22745098039215686, green: 0.5137254901960784, blue: 0.9450980392156862))

                Spacer()
                NavigationLink(destination: SwipeContentView()) {
                    Text("Понял")
                        .padding(.horizontal, 60)
                        .padding(.vertical, 8)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .background(Color("blueMain"))
                        .cornerRadius(20)

                }

                Spacer()

                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    Image("else")
                })
            }.padding(24)
                .background(Color(red: 0.9450980392156862, green: 0.9450980392156862, blue: 0.9450980392156862))
                .cornerRadius(10)
                .overlay(
                    LampView(isShowingSheet: $isShowingSheet)
                )
                .offset(x: x, y: y)
                .rotationEffect(.init(degrees: degree))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                x = value.translation.width
                                degree = 7 * (value.translation.width > 0 ? 1 : -1)
                            }
                        }

                        .onEnded { value in
                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                                switch value.translation.width {
//                                    case 0...100:
//                                        x = 0; degree = 0; y = 0;
//                                    case var x where x > 100:
//                                        x = 500; degree = 12;
//                                    case (-100)...(-1):
//                                        x = 0; degree = 0; y = 0;
//                                    case var x where x < -100:
//                                        x = -500; degree = -12
//                                    default: x = 0; y = 0
                                case 0...100:
                                    x = 0; degree = 0; y = 0
                                case let x where x > 200:
                                    self.x = 0; degree = 0
                                case (-100)...(-1):
                                    x = 0; degree = 0; y = 0;
                                case let x where x < -100:
                                    self.x = 0; degree = 0
                                default: x = 0; y = 0;
                                }
                            }
                        }
                )
        }.navigationBarHidden(true)
            .padding(.horizontal, 24)
            .sheet(isPresented: $isShowingSheet) {
                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.gray)

                        .frame(width: 60, height: 2)

                    Text("Тут будет информация от нашего электронного советника, которая поможет тебе разобраться с инвестициями")
                        .padding(24)
                        .font(.title3)
                    Spacer()
                }.padding()
            }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}


private struct HeaderView: View {

    var body: some View {
        HStack {
            HStack {
                Image("palm")
                Text("0")
                    .foregroundColor(.white)
                    .font(.title)
            }

            Spacer()

            HStack {
                Image("arms")
                Text("0")
                    .foregroundColor(.white)
                    .font(.title)
            }

            Spacer()

            HStack {
                Image("money")
                Text("0")
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
                        .strokeBorder(Color.black.opacity(0.3), lineWidth: 1)
                        .background(Circle().foregroundColor(Color.white))
                        .frame(width: 46, height: 46)

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
