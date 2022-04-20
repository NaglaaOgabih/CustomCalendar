//
//  CalendarHelper.swift
//  CustomCalendar
//
//  Created by Naglaa Ogabih on 19/04/2022.
//

import Foundation
import UIKit

class CalendarHelper{
    let calendar = Calendar.current
    
    func plusMount(date: Date) -> Date{
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    func minusMount(date: Date) -> Date{
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    func monthString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    func yearString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    func daysInMonth(date: Date) -> Int{
        let range = calendar.range(of: .day, in: .month, for: date)
        return range?.count ?? 0
    }
    func daysOfMonth(date: Date) -> Int{
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    func firstOfMonth(date: Date) -> Date{
        let components = calendar.dateComponents([.year , .month], from: date)
        return calendar.date(from: components)!
    }
    func weekDay(date: Date) -> Int{
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
     func addDays(date: Date, days: Int ) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    func sundayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
//            let currentWeakDay = calendar.dateComponents([.weekday], from: date).weekday

            if (currentWeakDay == 1){
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
    }
    func mondayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 2){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }

    func TuedayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 3){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }
    
    func wednesdayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 4){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }
    func thursdayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 5){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }
    func fridayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 6){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }
    func saturdayForDate(date:Date) -> Date{
        var current = date
        let oneWeekAgo = addDays(date: current , days: -7)
        while (current > oneWeekAgo){
            let currentWeakDay = calendar.dateComponents([.weekday], from: current).weekday
            if (currentWeakDay == 7){
                return current
            }
            current = addDays(date: current , days: -1)
        }
        return current
    }
}
