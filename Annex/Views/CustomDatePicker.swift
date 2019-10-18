//
//  CustomDatePicker.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//


import Foundation
import UIKit
import SwiftSignatureView

class CustomDatePicker: UIView{
    let datePicker = UIDatePicker()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addLabel(text: String){
        addDatePicker()
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        datePicker.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: datePicker.topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor, constant: 0),
        ])
    }
    
    fileprivate func addDatePicker(){
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        
        addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            datePicker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            datePicker.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            datePicker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            
        ])
        
    }
    
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        return strDate
    }
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let currentDate = dateFormatter.string(from: NSDate() as Date)
        return currentDate
    }
    func getYear() -> String{
        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"
        return yearFormatter.string(from: datePicker.date)
    }
    
    func getMonth() -> String{
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        return monthFormatter.string(from: datePicker.date)
    }
    
    func getDay() -> String{
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "d"
        return dayFormatter.string(from: datePicker.date)
    }
    
    func getDateObj() -> Date{
        return datePicker.date
    }
}
