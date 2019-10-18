//
//  ContractPreDisplayVC.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/18/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class ContractPreDisplayVC: UIViewController {
    var form: Form!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        guard let diffInDays = Calendar.current.dateComponents([.day], from: Date(), to: form.dateObj).day else {return}
        let topLabel = UILabel()
        topLabel.textAlignment = .center
        topLabel.text =
        """
        \(form.lendee) owes \(form.lender) \(form.amount)
        
        The contract was created \(form.creationDate)
        
        The contract ends \(form.dueDate)
        
        this contract has \(diffInDays) days left.
        
        Unique ID: \(form.uniqueId)
        """
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.numberOfLines = 10
        
        let previewView = ContractDisplayController()
        
        previewView.lenderAddress = form.lenderAddress
        previewView.lendeeAddress = form.lendeeAddress
        previewView.dueDate = form.dueDate
        previewView.date = form.creationDate
        previewView.amount = form.amount
        previewView.lenderName = form.lender
        previewView.lendeeName = form.lendee
        previewView.state = form.state
        previewView.city = form.city
        previewView.lenderImageData = form.lenderSignatureData
        previewView.lendeeImageData = form.lendeeSignatureData
        previewView.month = form.month
        previewView.day = form.day
        previewView.year = form.year
        
        let previewContainer = UIView()
        previewContainer.clipsToBounds = true
        previewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topLabel)
        view.addSubview(previewContainer)
        previewContainer.addSubview(previewView.view)
        
        
        
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            topLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            topLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previewContainer.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 25),
            previewContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.5),
            previewContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previewContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150)
        ])
        
        
    }
    
    @objc func fullScreen(){
        print("tapped")
                let nextViewController = ContractDisplayController()
                navigationController?.pushViewController(nextViewController, animated: true)
                nextViewController.lenderAddress = form.lenderAddress
                nextViewController.lendeeAddress = form.lendeeAddress
                nextViewController.dueDate = form.dueDate
                nextViewController.date = form.creationDate
                nextViewController.amount = form.amount
                nextViewController.lenderName = form.lender
                nextViewController.lendeeName = form.lendee
                nextViewController.state = form.state
                nextViewController.city = form.city
                nextViewController.lenderImageData = form.lenderSignatureData
                nextViewController.lendeeImageData = form.lendeeSignatureData
                nextViewController.month = form.month
                nextViewController.day = form.day
                nextViewController.year = form.year
    }
}
