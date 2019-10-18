//
//  CustomView.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import SwiftSignatureView

class CustomView: UIView{
    
    var stackView: UIStackView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupStackView(){
        self.layer.cornerRadius = 15
        
        stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 16

        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                                     stackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)])
    }
    
     func addLabel(text: String){
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
    }
    
    func addTextbox(placeHolderText: String, keyboardType: UIKeyboardType, _ tag: Int = 0,  _ size: Double = 2, leftView: UIView = UIView()){
        let textBox = UITextField()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.keyboardType = keyboardType
        textBox.placeholder = placeHolderText
        textBox.backgroundColor = .white
        textBox.layer.shadowColor = UIColor.black.cgColor
        textBox.layer.shadowOffset = CGSize(width: 0, height: 2)
        textBox.layer.shadowRadius = 0
        textBox.layer.shadowOpacity = 1.0
        textBox.leftViewMode = .always
        textBox.leftView = leftView
        textBox.tag = tag
        stackView.addArrangedSubview(textBox)
        NSLayoutConstraint.activate([
            textBox.widthAnchor.constraint(equalToConstant: stackView!.bounds.width / CGFloat(size))
        ])
    }
    func addDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.layer.masksToBounds = true
        datePicker.layer.cornerRadius = 15
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.layer.cornerRadius = 15
        datePicker.layer.shadowOpacity = 0.5
        datePicker.layer.shadowRadius = 5
        datePicker.tag = 0
        datePicker.layer.shadowOffset = CGSize(width: 0, height: 5)
        datePicker.backgroundColor = .white
        stackView.addArrangedSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.widthAnchor.constraint(equalToConstant: stackView!.bounds.width)
        ])
    }
    
    func addSignatureView(){
        let view = SwiftSignatureView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        view.maximumStrokeWidth = 10
        view.backgroundColor = .white
        
        stackView.addArrangedSubview(view)
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: stackView!.bounds.width)
        ])
        
    }
}
