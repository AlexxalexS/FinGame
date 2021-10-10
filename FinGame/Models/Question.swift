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
            image: "student10",
            rightSwipte: Card.Choose(fun: 5, social: 0, money: 10, text: "Воспользуемся инвестиционными инструментами"),
            leftSwipe: Card.Choose(fun: 0, social: 0, money: 5, text: "Оформим вклад в банке")
        )
    ),

    Question(
        title: "Вы купили акции, сегодня она дала роста +40%, что делаем?",
        notification: true,
        notificationText:
"""
Среди стратегий можно выделить две наиболее популярных:
“купить дешевле, продать дороже”, сопряженная с высокими рисками, т.к. цена акций меняется на бирже ежесекундно и может “сыграть” в обратную сторону;
дивидендная стратегия - сохранение акций в портфеле для получения дохода в виде дивидендов, а не перспективе роста стоимости акций. Данная стратегия сопряжена с меньшими рисками.
""",
        card: Card(
            image: "student5",
            rightSwipte: Card.Choose(fun: 0, social: 0, money: 0, text: "Оставляем"),
            leftSwipe: Card.Choose(fun: 10, social: 5, money: 15, text: "Продаем!")
        )
    ),

    // просто текст
    Question(
        title: "После этого стоимость акции упала на 60%. Помните, падение может быть временным, не поддавайтесь эмоциям и примите взвешенное решение о дальнейшей судьбе акции.",
        notification: true,
        notificationText:
"""
Среди стратегий можно выделить две наиболее популярных:
“купить дешевле, продать дороже”, сопряженная с высокими рисками, т.к. цена акций меняется на бирже ежесекундно и может “сыграть” в обратную сторону;
дивидендная стратегия - сохранение акций в портфеле для получения дохода в виде дивидендов, а не перспективе роста стоимости акций. Данная стратегия сопряжена с меньшими рисками.
""",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: ""),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 5, text: "")
        )
    ),

    Question(
        title: "После продажи акции выросли ещё на 40%. Чтобы не сожалеть об упущенной выгоде, не стоит принимать спонтанных решений.",
        notification: true,
        notificationText:
"""
Среди стратегий можно выделить две наиболее популярных:
“купить дешевле, продать дороже”, сопряженная с высокими рисками, т.к. цена акций меняется на бирже ежесекундно и может “сыграть” в обратную сторону;
дивидендная стратегия - сохранение акций в портфеле для получения дохода в виде дивидендов, а не перспективе роста стоимости акций. Данная стратегия сопряжена с меньшими рисками.
""",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: ""),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 5, text: "")
        )
    ),


    Question(
        title: "Совет от друга: “Я уверен в высокой доходности DogeCoin, вкладывайся скорее”",
        notification: true,
        notificationText: "Dogecoin -  криптовалюта. Несмотря на то, что криптовалюта остается высокорисковым активом, при наличии определенных знаний инвестиции в нее могут принести прибыль довольно быстро.",
        card: Card(
            image: "student6",
            rightSwipte: Card.Choose(fun: 0, social: -10, money: 5, text: "Нет, это не для меня"),
            leftSwipe: Card.Choose(fun: -30, social: 15, money: -100, text: "Да, друг плохого не посоветует")
        )
    ),



    // always gameover by friend
    Question(
        title: "Вы вложились в тот момент, когда на рынке Dogecoin разворачивался pump&dump. Вы потеряли все свои вложения",
        notification: true,
        notificationText: "Pump and Dump – манипулятивная схема повышения курса криптовалюты с последующим ценовым обвалом. Крупные владельцы активов искусственно повышают («накачивают», pump) их стоимость, чтобы впоследствии продать («сбросить», dump) максимально дорого мелким трейдерам. В результате стоимость актива снижается, а инвесторы теряют средства.",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: "Очень жаль, но я готов продолжать", isGameOver: true),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 5, text: "Я расстроен, но не сломлен", isGameOver: true)
        )
    ),



    Question(
        title: "Что на счёт валюты? Может, приобретём немного?",
        notification: true,
        notificationText: "Вкладываться можно в том числе и в валюту. К примеру, Доллар США является довольно стабильной валютой из-за использования его в качестве эквивалента по всему миру.",
        card: Card(
            image: "student7",
            rightSwipte: Card.Choose(fun: 0, social: 0, money: +5, text: "Не стоит. Я верю в Российский рубль"),
            leftSwipe: Card.Choose(fun: 5, social: 0, money: 10, text: "Хорошая идея. И цена на Али не будет скакать")
        )
    ),

    Question(
        title: "К вам пришел тот самый друг, что предложил вложиться в DogeCoin. Он потерял все свои вложения в результате Pump&Dump. Теперь хочет взять у вас денег в долг. Даем?",
        notification: true,
        notificationText: "Pump and Dump – манипулятивная схема повышения курса криптовалюты с последующим ценовым обвалом. Крупные владельцы активов искусственно повышают («накачивают», pump) их стоимость, чтобы впоследствии продать («сбросить», dump) максимально дорого мелким трейдерам. В результате стоимость актива снижается, а инвесторы теряют средства.",
        card: Card(
            image: "student4",
            rightSwipte: Card.Choose(fun: -5, social: 15, money: -10, text: "Конечно, да, это же друг!"),
            leftSwipe: Card.Choose(fun: -5, social: -15, money: 5, text: "Сложно отказывать, но придется")
        )
    ),

    //text
    Question(
        title: "Вы повели себя как рыцарь, но ваш друг сбежал, сверкая пятками, в попытках снова заработать на криптовалюте.",
        notification: true,
        notificationText:
"""
Среди стратегий можно выделить две наиболее популярных:
“купить дешевле, продать дороже”, сопряженная с высокими рисками, т.к. цена акций меняется на бирже ежесекундно и может “сыграть” в обратную сторону;
дивидендная стратегия - сохранение акций в портфеле для получения дохода в виде дивидендов, а не перспективе роста стоимости акций. Данная стратегия сопряжена с меньшими рисками.
""",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: ""),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 0, text: "")
        )
    ),


    Question(
        title: "Вы достаточно серьезно увлеклись инвестированием, и не проводили время за дружескими посиделками очень давно. А тут вас приглашают на недельный поход в лес. Интернета всю неделю не будет. Идем?",
        notification: false,
        notificationText: "",
        card: Card(
            image: "student9",
            rightSwipte: Card.Choose(fun: 25, social: 25, money: -15, text: "Я заслужил этот отдых да и природу я люблю"),
            leftSwipe: Card.Choose(fun: -30, social: -30, money: 15, text: "Что станет за неделю с моими акциями?! Отказываюсь!!!")
        )
    ),

    // always gameover 2
    Question(
        title: "В инвестировании, как и в любой другой работе важно не забывать о жизни, дабы не терять интерес к новому увлечению и получать вдохновение от других занятий. Не забывайте и о других аспектах вашей жизни.",
        notification: false,
        notificationText: "",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: 0, social: 0, money: 0, text: "Очень жаль, но я готов продолжать", isGameOver: true),
            leftSwipe: Card.Choose(fun: 0, social: 0, money: 5, text: "Я расстроен, но не сломлен", isGameOver: true)
        )
    ),



    Question(
        title: "Попробуем вложиться в драг. металлы?",
        notification: true,
        notificationText: "В случае любых инвестиций важно не принимать поспешных решений, основанных только на чьем-то мнении. Инвестиции в драгоценные металлы, действительно, помогут вам сохранить сбережения, но только если это вложения на долгий срок — не меньше 10–15 лет. На коротком отрезке времени у вас есть шанс не только не нарастить, но даже потерять часть накоплений",
        card: Card(
            image: "student8",
            rightSwipte: Card.Choose(fun: 0, social: 0, money: 0, text: "Надо подумать"),
            leftSwipe: Card.Choose(fun: 0, social: 0, money: 10, text: "Да, слышал, что это что-то из надежного")
        )
    ),



    Question(
        title: "Поздравляем! Вы достойно дошли до конца. Настало время попробовать свои силы в деле!",
        notification: false,
        notificationText: "",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: "Тогда начнём!"),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 0, text: "Я в деле!")
        )
    ),

    Question(
        title: "Поздравляем! Вы достойно дошли до конца. Рекомендуем немножко подтянуть теорию, и в бой!",
        notification: false,
        notificationText: "",
        card: Card(
            image: "",
            rightSwipte: Card.Choose(fun: -5, social: 0, money: 0, text: "Так точно, капитан!"),
            leftSwipe: Card.Choose(fun: -5, social: 0, money: 0, text: "Да, капитан!")
        )
    ),






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

