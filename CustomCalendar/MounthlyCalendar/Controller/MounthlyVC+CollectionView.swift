//
//  MonthlyVC+CollectionView.swift
//  CustomCalendar
//
//  Created by Naglaa Ogabih on 19/04/2022.
//

import UIKit
extension MonthlyCalendarViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthlyCell", for: indexPath) as! MonthlyCollectionViewCell
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let day = formatter.string(from: today)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: today)
        let monthName = DateFormatter().monthSymbols[Int(month)! - 1]
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: today)

        if selectedIndex == indexPath.row{
            cell.backgroundColor = UIColor(named: "CustomPurple")
            cell.layer.cornerRadius = 10
            cell.dayOfMonth.textColor = .white
        }
        else{
            cell.backgroundColor = UIColor.white
            cell.dayOfMonth.textColor = UIColor(named: "CustomPurple")
            if cell.dayOfMonth.text == day && monthName == CalendarHelper().monthString(date: selectedDate) &&  CalendarHelper().yearString(date: selectedDate) == year {
                cell.backgroundColor = UIColor.lightGray
                cell.layer.cornerRadius = 10
                cell.dayOfMonth.textColor = .white
            }
        }
        
        if cell.dayOfMonth.text == ""{
            cell.isUserInteractionEnabled = false
            cell.backgroundColor = UIColor.white
        }else{
            cell.isUserInteractionEnabled = true
        }

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 2) / 8 , height: (collectionView.frame.size.height - 2) / 8 )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let day = totalSquares[indexPath.item]
        let month = Calendar.current.component(.month, from: selectedDate)
        let year = Calendar.current.component(.year, from: selectedDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        selectedDateFromMonthlyCalender = "\(year)-\(month)-\(day) 12:02:00 +0000"
        date = dateFormatter.date(from: selectedDateFromMonthlyCalender)!
        collectionView.reloadData()
    }
}
