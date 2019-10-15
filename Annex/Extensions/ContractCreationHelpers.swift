//
//  ContractCreationExtensions.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

extension ContractCreationViewController {
    
    func createLableAndTextBoxView(lableText: String, placeHolderText: String) -> UIView{
        let returnView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 15
            view.layer.shadowOpacity = 0.5
            view.layer.shadowRadius = 5
            view.layer.shadowOffset = CGSize(width: 0, height: 5)
            view.backgroundColor = UIColor.white
            
            let lable = UILabel()
            lable.translatesAutoresizingMaskIntoConstraints = false
            lable.text = lableText
            
            let textBox = UITextField()
            textBox.translatesAutoresizingMaskIntoConstraints = false
            textBox.keyboardType = .numbersAndPunctuation
            textBox.placeholder = placeHolderText
            
            let line = UIView()
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = .black
            
            view.addSubview(lable)
            view.addSubview(textBox)
            view.addSubview(line)
            NSLayoutConstraint.activate([lable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                         lable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25),
                                         
                                         
                                         textBox.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 25),
                                         textBox.centerXAnchor.constraint(equalTo: lable.centerXAnchor, constant: 0),
                                         textBox.heightAnchor.constraint(equalToConstant: 25),
                                         textBox.widthAnchor.constraint(equalToConstant: 200),
                                         
                                         
                                         line.leadingAnchor.constraint(equalTo: textBox.leadingAnchor, constant: 0),
                                         line.trailingAnchor.constraint(equalTo: textBox.trailingAnchor, constant: 0),
                                         line.topAnchor.constraint(equalTo: textBox.bottomAnchor, constant: 0),
                                         line.heightAnchor.constraint(equalToConstant: 1)])
            
            return view
        }()
        
        return returnView
        
    }
}
