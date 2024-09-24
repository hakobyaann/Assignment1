//
//  Main.swift
//  SimpleDate
//
//  Created by Anna Hakobyan on 23.09.24.
//

import Foundation

struct Main {
    static func main() {
        let time = Time(hour: 12, minute: 30, format: .tewntyFour)
        let date = SimpleDate(year: 2003, month: 12, day: 3, time: time)
        print(time.showTimeFormat())
        print(date.showDate(in: .full12))
    }
}

