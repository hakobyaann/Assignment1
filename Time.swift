//
//  Time.swift
//  SimpleDate
//
//  Created by Anna Hakobyan on 23.09.24.
//

import Foundation

public enum Format: Int {
    case twelve = 12
    case tewntyFour = 24
}

public struct Time {
    private let hour: Int
    private let minute: Int
    private let format: Format

    init(hour: Int, minute: Int, format: Format = .tewntyFour) { //The default time format is 24-hour
        self.hour = hour
        self.minute = minute
        self.format = format
    }

    func showTimeFormat(in format: Format? = nil) -> String {
        let currentFormat = format ?? self.format
        var result = ""
        var ampmSymbol = ""

        if currentFormat == .twelve { //Hnadling the 12-hour format
            if hour == 0 { // the case of 0 in 12-hour format
                result += "12"
                ampmSymbol = "am"
            } else if hour == 12 { // the case of 12 in 12-hour format
                result += "12"
                ampmSymbol = "pm"
            } else { //Handling the 24-hour format
                result += hour > 12 ? String(hour - 12) : String(hour)
                ampmSymbol = hour > 12 ? "pm" : "am"
            }
        } else {
            if hour < 10 {
                result += "0"
            }
            result += String(hour)
        }

        if minute < 10 {
            result += "0"
        }

        result += ":"
        result += String(minute)

        return result + ampmSymbol
    }
}
