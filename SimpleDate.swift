//
//  SimpleDate.swift
//  SimpleDate
//
//  Created by Anna Hakobyan on 23.09.24.
//

import Foundation

enum DateFormat {
    case dateOnly
    case short
    case full12
    case full24
}

struct SimpleDate {
    private let year: Int
    private let month: Int
    private let day: Int
    private let time: Time

    init(year: Int, month: Int, day: Int, time: Time) {
        self.year = year
        self.month = month
        self.day = day
        self.time = time
    }

    func showDate(in dateFormat: DateFormat) -> String {
        var result = ""

        switch dateFormat {
        case .dateOnly:
            result = dateOnly()
        case .short:
            result = short()
        case .full12:
            result = full12()
        case .full24:
            result = full24()
        }
        return result
    }

    private func analyzeData() -> [String] {
        var result: [String] = [] //Loading all the date information in an array to take the desired one
        var str = ""

        if month < 10 {
            str += "0"
        } else if month > 12 {
            fatalError("Wrong month data!")
        }
        str += String(month) + "/"
        result.append(str)
        str = ""

        if day < 10 {
            str += "0"
        } else if day > 30 {
            fatalError("Wrong day data")
        }
        str += String(day) + "/"
        result.append(str)
        str = ""

        if year > 2024 {
            fatalError("Wrong year data")
        }
        str += String(year)
        result.append(str)

        return result
    }

//MARK: Date showing functions -> MM/dd/yyyy/time(am,pm)
    private func dateOnly() -> String {
        let arrayOfData = analyzeData()
        return arrayOfData[0] + arrayOfData[1] + arrayOfData[2]
    }

    private func short() -> String {
        let arrayOfData = analyzeData()
        return arrayOfData[0] + arrayOfData[2]
    }

    private func full12() -> String {
        var arrayOfData = analyzeData()
        arrayOfData.append("/" + time.showTimeFormat(in: .twelve))
        return arrayOfData[0] + arrayOfData[1] + arrayOfData[2] + arrayOfData[3]
    }

    private func full24() -> String {
        var arrayOfData = analyzeData()
        arrayOfData.append("/" + time.showTimeFormat(in: .tewntyFour))
        return arrayOfData[0] + arrayOfData[1] + arrayOfData[2] + arrayOfData[3]
    }
}
