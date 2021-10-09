//
//  SwipeContentView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct SwipeContentView: View {
    var body: some View {
        VStack {
            HeaderView()
                .padding(.horizontal)

            ZStack {
                ForEach(Card.data) { card in
                    CardView(card: card).padding(8)
                }
            }

            HStack {
                HeaderView()
                HeaderView()
            }
            .padding(.horizontal)
        }.background(Color.blue.opacity(0.2))
    }
}

struct SwipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeContentView()
    }
}

private struct CardView: View {

    @State var card: Card

    var body: some View {
        ZStack {
            Image(card.image)
                .resizable()

            VStack {
                Spacer()
                HStack {
                    Text(card.text)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
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
                            case (-100)...(-1):
                                card.x = 0; card.degree = 0; card.y = 0;
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            default: card.x = 0; card.y = 0;
                            }
                        }
                    }
            )
    }

}

private struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
            })

            Spacer()

            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
            })

            Spacer()

            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
            })
        }
    }
}
