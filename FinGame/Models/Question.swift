import UIKit
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title: String
    var notification: Bool
    var notificationText: String
    var card: Card
}

var student1 = [
    Question(
        title: "Как время проведем?",
        notification: true,
        notificationText: "Студенчество отличное время пробовать свои силы и формировать финансовый опыт. Первым шагом с созданию сбережений можно быть открытие вклада или накопительного счета. С ВТБ сделать это просто.",
        card: Card(
            image: "student1",
            rightSwipte: Card.Choose(fun: 5, social: 5, money: 0, text: "Остнанусь дома и посмотрю сериал"),
            leftSwipe: Card.Choose(fun: -5, social: 5, money: 0, text: "Пойду на пары")
        )
    ),
    Question(
        title: "На карточку упала стипендия, идем в кино с одногруппниками?",
        notification: true,
        notificationText: "Студенчество отличное время пробовать свои силы и формировать финансовый опыт. Первым шагом с созданию сбережений можно быть открытие вклада или накопительного счета. С ВТБ сделать это просто.",
        card: Card(
            image: "student2",
            rightSwipte: Card.Choose(fun: -5, social: -5, money: 5, text: "Нет"),
            leftSwipe: Card.Choose(fun: 10, social: 10, money: -5, text: "Да")
        )
    ),
    Question(
        title: "Как будем хранить сбережения?",
        notification: true,
        notificationText: "По данным Минэкономразвития, в 2021 году инфляция в России составила около 5,8%. Не в каждом банке процент вклада больше инфляции, поэтому выгоднее инвестировать.",
        card: Card(
            image: "student4",
            rightSwipte: Card.Choose(fun: 5, social: 0, money: 10, text: "Воспользуемся инвестиционными инструментами"),
            leftSwipe: Card.Choose(fun: 0, social: 0, money: 5, text: "Оформим вклад в банке")
        )
    ),



    

//    Question(
//        title: "Вчера купили акции, сегодня она дала роста +40%, что делаем?",
//        notification: true,
//        notificationText: "Начинать инвестировать можно с небольших сумм: в первые годы итоговый результат не будет большим, но это позволит выработать полезную привычку, получить знания и опыт, запустить механизм сложного процента (Как накопить, или чудо сложных процентов | ВТБ | Яндекс Дзен (yandex.ru))",
//        card: Card(
//            image: "student4",
//            rightSwipte: Card.Choose(fun: 30, social: 5, money: 40, text: "Продаем"),
//            leftSwipe: Card.Choose(fun: 5, social: 0, money: 5, text: "Оставляем")
//        )
//    ),
//    Question(
//        title: "Все говорят о криптовалюте, берем?",
//        notification: true,
//        notificationText: "Начинать инвестировать можно с небольших сумм: в первые годы итоговый результат не будет большим, но это позволит выработать полезную привычку, получить знания и опыт, запустить механизм сложного процента (Как накопить, или чудо сложных процентов | ВТБ | Яндекс Дзен (yandex.ru))",
//        card: Card(
//            image: "student5",
//            rightSwipte: Card.Choose(fun: -5, social: -5, money: 0, text: "Да, слышал, биткоин дорожает"),
//            leftSwipe: Card.Choose(fun: 0, social: 5, money: 0, text: "Нет, как-то ненадежно")
//        )
//    )
]

//var work1 = [
//    Question(
//        title: "Как поступим?",
//        notification: false,
//        notificationText: "",
//        card: Card(
//            image: "work1",
//            rightSwipte: Card.Choose(fun: 0, social: 15, money: -10, text: "Взять отгул и остаться с семьей"),
//            leftSwipe: Card.Choose(fun: -10, social: 0, money: 10, text: "Взять доп.смену")
//        )
//    ),
//    Question(
//        title: "После работы заглянуть в бар с коллегами?",
//        notification: false,
//        notificationText: "",
//        card: Card(
//            image: "work2",
//            rightSwipte: Card.Choose(fun: -5, social: -5, money: 5, text: "Нет"),
//            leftSwipe: Card.Choose(fun: 10, social: 10, money: -5, text: "Идем!")
//        )
//    ),
//    Question(
//        title: "Выбираем подарок другу на юбилей",
//        notification: false,
//        notificationText: "",
//        card: Card(
//            image: "work3",
//            rightSwipte: Card.Choose(fun: 0, social: -5, money: 0, text: "Торт и моё почтение"),
//            leftSwipe: Card.Choose(fun: 0, social: 10, money: -15, text: "Наручные часы")
//        )
//    )
//]


//struct Question: Identifiable {
//    let id = UUID()
//    let number: Int
//    var state: Bool
//    let questionText: String
//    var responseMessages: [String]
//}

