//
//  Card.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import UIKit

struct Card: Identifiable {
    let id = UUID()
    let text: String
    let image: String

    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0

    static var data: [Card] {
        [
            Card(text: "Lol", image: "image1"),
            Card(text: "kek", image: "image2"),
            Card(text: "cheburek", image: "image3"),
            Card(text: "hi!", image: "image4"),
            Card(text: "by!", image: "image1"),
        ]
    }
}


