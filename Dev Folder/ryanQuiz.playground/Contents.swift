//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport




let dateComponent = DateComponents(calendar: .current, year: 1988, month: 12, day: 4, hour: 13, minute: 23)

let dateFormatter1: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy, h:m"
    return dateFormatter
} ()

