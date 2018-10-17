//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum DayOfWeek {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

let dayOfWeek = DayOfWeek.wednesday

print(dayOfWeek)

var day: DayOfWeek?
day = .sunday
//you can do .sunday cause var day is of type DayOfWeek

func printDay(day: DayOfWeek){
    print(day)
}

printDay(day: .saturday)

func printNextDay(day: DayOfWeek) {
    switch day {
    case DayOfWeek.sunday:
        print(DayOfWeek.monday)
    case.monday:
        print(DayOfWeek.sunday)
    case.tuesday:
        print(DayOfWeek.wednesday)
    case.wednesday:
        print(DayOfWeek.thursday)
    case.thursday:
        print(DayOfWeek.friday)
    case.friday:
        print(DayOfWeek.saturday)
    case.saturday:
        print(DayOfWeek.sunday)
        
    }

func printsWeekDayOrWeekend(day: DayOfWeek) {
    switch day {
    case .friday, .sunday, .saturday:
        print("weekend")
    default:
        print("weekday")
    }
        
    }
}

struct Card {
    let name: String
    static let number = "70"
}
Card.number
let card = Card(name: "")
card.name
