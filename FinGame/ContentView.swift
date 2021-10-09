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
            NavigationLink("To swipe", destination: SwipeContentView())
                .foregroundColor(.red)
        }

    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}


