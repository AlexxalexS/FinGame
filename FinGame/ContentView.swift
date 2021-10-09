//
//  ContentView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            NavigationLink(destination: QuizView()) {
                VStack {
                    VStack {
                        Text("Привет")
                            .font(.title)

                        Text("Давай знакомиться")
                            .font(.largeTitle)
                    }.offset(y: -40)


                    Text("Погнали")
                        .font(.title2)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 48)
                        .background(Color("blueMain"))
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .offset(y: -40)
                    
                }.foregroundColor(.black)

            }
        }.navigationBarHidden(true)

    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}


