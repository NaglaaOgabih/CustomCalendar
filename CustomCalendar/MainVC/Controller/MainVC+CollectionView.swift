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
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        weeklySelectedDate = totalSquares[indexPath.item]
        collectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 9 , height: collectionView.bounds.height )
    }
}
