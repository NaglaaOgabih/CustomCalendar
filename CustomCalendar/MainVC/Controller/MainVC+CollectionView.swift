//
//  MainVC+TableView.swift
//  CustomCalendar
//
//  Created by Naglaa Ogabih on 19/04/2022.
//

import UIKit

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CalendarCollectionViewCell
        cell.dayLabel.text = daysArray[indexPath.row]
        let date = totalSquares[indexPath.item]
        cell.dateLabel.text = String(CalendarHelper().daysOfMonth(date: date))
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let day = formatter.string(from: daySelected)
         trimmedDay = day.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
        
        fullDate = detailsLabel.text

        var fullDateArr = fullDate?.components(separatedBy: " ")
        var CalenderMonth: String = fullDateArr![0]
//        print("CalenderMonth\(CalenderMonth)")
        
        var CalenderYear: String = fullDateArr![1]
        formatter.dateFormat = "MM"
        let month = Int(formatter.string(from: daySelected))
        trimmedMonth = DateFormatter().monthSymbols[month! - 1]
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: daySelected)
        
        if cell.dateLabel.text! == trimmedDay && CalenderMonth == trimmedMonth && CalenderYear == year {
            cell.backgroundColor = UIColor.gray
            cell.dateLabel.textColor = UIColor.white
            cell.dayLabel.textColor = UIColor.white
        }
        else{
            cell.backgroundColor = UIColor(named: "CustomGray")
            cell.dateLabel.textColor = UIColor(named: "CustomPurple")
            cell.dayLabel.textColor = UIColor(named: "CustomPurple")
        }

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        daySelected = totalSquares[indexPath.item]
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let selectMonth = Int(formatter.string(from: totalSquares[indexPath.item]))
        let trimmedSelectedMonth = DateFormatter().monthSymbols[selectMonth! - 1]
        
        formatter.dateFormat = "yyyy"
        let selectYear = formatter.string(from: totalSquares[indexPath.item])
        detailsLabel.text = "\(trimmedSelectedMonth)" + " " + "\(selectYear)"
        
        collectionView.reloadData()
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 9 , height: collectionView.bounds.height )
    }
}
