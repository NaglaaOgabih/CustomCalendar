//
//  MonthlyCalendarViewController.swift
//  CustomCalendar
//
//  Created by Naglaa Ogabih on 19/04/2022.
//

import UIKit

class MonthlyCalendarViewController: UIViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var monthsCollectionView: UICollectionView!
    var indexPathSelected : Int?
    var callback : ((Date) -> Void)?
    var selectedDate = Date()
    var userSelectedDate = Date()
    let today = Date()
    var totalSquares = [String]()
    var selectedIndex : Int?
    var selectedDateFromMonthlyCalender : String = ""
    var date : Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        setMonthView()
    }
    @IBAction func previousMonthPressed(_ sender: Any) {
        selectedDate = CalendarHelper().minusMount(date: selectedDate)
        setMonthView()
        selectedIndex = nil
    }
    
    @IBAction func nextMonthPressed(_ sender: Any) {
        selectedDate = CalendarHelper().plusMount(date: selectedDate)
        setMonthView()
        selectedIndex = nil
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okBtnPressed(_ sender: Any) {
        callback?(date!)
        dismiss(animated: true, completion: nil)
    }
    override var shouldAutorotate: Bool{
        return false
    }
    
    func setMonthView(){
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        var count = 1
        while(count <= 42){
            if (count <= startingSpaces || count - startingSpaces > daysInMonth){
                totalSquares.append("")
            }else{
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
            monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
            monthsCollectionView.reloadData()
        }
    }
}

