//
//  Card.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import UIKit

struct Card: Identifiable {
    let id = UUID()
    let image: String
    var textfield: String = ""
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    var rightSwipte: Choose
    var leftSwipe: Choose

    struct Choose {
        let fun: Int
        let social: Int
        let money: Int
        let text: String
        var isGameOver: Bool = false
    }
}


