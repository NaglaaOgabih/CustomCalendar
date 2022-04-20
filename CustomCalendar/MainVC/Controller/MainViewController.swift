//
//  ViewController.swift
//  CustomCalendar
//
//  Created by Naglaa Ogabih on 19/04/2022.
//

import UIKit

class MainViewController: UIViewController {
    let daysArray = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    var weeklySelectedDate = Date()
    var totalSquares = [Date]()
    @IBOutlet weak var daysCollectionView: UICollectionView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWeeklyViewFirstTime()
    }
    @IBAction func calendarBtnPressed(_ sender: Any) {
        
    }
    @IBAction func BackBtnPressed(_ sender: Any) {
        weeklySelectedDate = CalendarHelper().addDays(date: weeklySelectedDate, days: -7)
        setWeeklyViewFirstTime()
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        weeklySelectedDate = CalendarHelper().addDays(date: weeklySelectedDate, days: 7)
        setWeeklyViewFirstTime()
    }
    func setWeeklyViewFirstTime(){
        totalSquares.removeAll()
        var current = CalendarHelper().sundayForDate(date: weeklySelectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        while current < nextSunday {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        detailsLabel.text = CalendarHelper().monthString(date: self.weeklySelectedDate) + " " + CalendarHelper().yearString(date: self.weeklySelectedDate)
        daysCollectionView.reloadData()
    }
    func setWeeklyView(){
        totalSquares.removeAll()
        let weekday = Calendar.current.component(.weekday, from: weeklySelectedDate)
        var current : Date = CalendarHelper().sundayForDate(date: weeklySelectedDate)
        
        let sunday = Calendar.current.date(byAdding: .day , value: 0, to: current)!
        let monday = Calendar.current.date(byAdding: .day , value: 1, to: current)!
        let tuesday = Calendar.current.date(byAdding: .day , value: 2, to: current)!
        let wednesday = Calendar.current.date(byAdding: .day , value: 3, to: current)!
        let thursday = Calendar.current.date(byAdding: .day , value: 4, to: current)!
        let friday = Calendar.current.date(byAdding: .day , value: 5, to: current)!
        
        
        if weekday == 1{
            current = CalendarHelper().sundayForDate(date: weeklySelectedDate)
            let nextSunday = CalendarHelper().addDays(date: current, days: 7)
            while current < nextSunday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current, days: 1)
            }
        }else if weekday == 2 {
            let sunday = Calendar.current.date(byAdding: .day , value: 0, to: current)!
            totalSquares.append(sunday)
            current = CalendarHelper().mondayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 1, days: 6)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 1, days: 1)
            }
        }else if weekday == 3 {
            totalSquares.append(sunday)
            totalSquares.append(monday)
            current = CalendarHelper().TuedayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 2, days: 5)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 2, days: 1)
            }
        }else if weekday == 4 {
            totalSquares.append(sunday)
            totalSquares.append(monday)
            totalSquares.append(tuesday)
            current = CalendarHelper().wednesdayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 3, days: 4)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 3, days: 1)
            }
        }else if weekday == 5 {
            totalSquares.append(sunday)
            totalSquares.append(monday)
            totalSquares.append(tuesday)
            totalSquares.append(wednesday)

            current = CalendarHelper().thursdayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 4, days: 3)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 4, days: 1)
            }
        }else if weekday == 6 {
            totalSquares.append(sunday)
            totalSquares.append(monday)
            totalSquares.append(tuesday)
            totalSquares.append(wednesday)
            totalSquares.append(thursday)
            current = CalendarHelper().fridayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 5, days: 2)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 5, days: 1)
            }
        }else if weekday == 7 {
            totalSquares.append(sunday)
            totalSquares.append(monday)
            totalSquares.append(tuesday)
            totalSquares.append(wednesday)
            totalSquares.append(thursday)
            totalSquares.append(friday)
            current = CalendarHelper().saturdayForDate(date: weeklySelectedDate)
            let nextMonday = CalendarHelper().addDays(date: current + 6, days: 1)
            while current < nextMonday {
                totalSquares.append(current)
                current = CalendarHelper().addDays(date: current + 6, days: 1)
            }
        }
        detailsLabel.text = CalendarHelper().monthString(date: self.weeklySelectedDate) + " " + CalendarHelper().yearString(date: self.weeklySelectedDate)
        daysCollectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? MonthlyCalendarViewController {
            viewControllerB.callback = { date in
                self.weeklySelectedDate = date
                self.setWeeklyView()
            }
        }
    }
}
