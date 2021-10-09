//
//  SwipeContentView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct SwipeContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            HeaderView()
                .padding(.horizontal, 24)

            DividerView()

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna lacus, rhoncus in risus at amet, et, hendrerit.")
                .foregroundColor(Color("blueDark"))
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.vertical, 16)

            DividerView()

            ZStack {
                ForEach(Card.data) { card in
                    CardView(card: card).padding(.horizontal, 24)
                }
            }
            Spacer()
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

    var body: some View {
        ZStack {
            Image(card.image)
                .resizable()

            VStack {
                Spacer()
                HStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")

                        .padding(8)
                        .background(Color.black.opacity(0.2))
                        .padding(21)
                        .font(.footnote)
                        .foregroundColor(Color("lightGray"))
                        .cornerRadius(8)
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
            HStack {
                Image("palm")
                Text("100")
                    .foregroundColor(.white)
                    .font(.title)
            }

            Spacer()

            HStack {
                Image("arms")
                Text("100")
                    .foregroundColor(.white)
                    .font(.title)
            }


            Spacer()

            HStack {
                Image("palm")
                Text("100")
                    .foregroundColor(.white)
                    .font(.title)
            }
        }.padding(.horizontal, 16)
            .padding(.vertical, 21)
            .background(Color("blueMain"))
            .cornerRadius(8)
        

    }
}
