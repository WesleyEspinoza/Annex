//
//  ContractCreationObjCFuncs.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import SwiftSignatureView
import Realm
extension ContractCreationViewController {
    
    @objc func exitButtontapDown(_ sender: AnyObject) -> Void{
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func nextButtontapUp(_ sender: AnyObject) -> Void{
        nextButton.alpha = 1

        nextPage()
        if nextButton.titleLabel!.text == "Done" {
             save()
         }
        
        if pageControl.currentPage == 6 {
            nextButton.setTitle("Done", for: .normal)
        }
 
    }
    
    private func nextPage() {
        let nextIndex = min(pageControl.currentPage + 1, views.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func nextButtontapCancelled(_ sender: AnyObject) -> Void{
        nextButton.alpha = 1
    }
    @objc func nextButtontapDown(_ sender: AnyObject) -> Void{
        nextButton.alpha = 0.5
    }
    
    @objc func backButtontapUp(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if pageControl.currentPage < 6 {
            nextButton.setTitle("Next", for: .normal)
        }
        
    }
    
    @objc func backButtontapCancelled(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
    }
    @objc func backButtontapDown(_ sender: AnyObject) -> Void{
        backButton.alpha = 0.5
    }
    
    func randomString(_ length: Int) -> String {

        let letters : NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
    
    
     func save() -> Void{
        let form = Form()
        
        form.month = dueDateView.getMonth()
        form.day = dueDateView.getDay()
        form.year = dueDateView.getYear()
        form.dueDate = dueDateView.getDateString()
        form.creationDate = dueDateView.getCurrentDate()
        form.dateObj = dueDateView.getDateObj()
        form.uniqueId = randomString(12).inserting(separator: "-", every: 4)
        

        if let amountTextField = self.amountView.viewWithTag(1) as? UITextField  {
            form.amount = "$\(amountTextField.text ?? "")"
        }
        
        
        
        if let lenderTextField = self.lenderView.viewWithTag(1) as? UITextField {
            form.lender = lenderTextField.text ?? ""
        }
        
        
        
        
        if let lendeeTextField = self.lendeeView.viewWithTag(1) as? UITextField {
            form.lendee = lendeeTextField.text ?? ""
        }
        
        
        if let addressTextField = self.lenderAddressView.viewWithTag(1) as? UITextField {
            form.lenderAddress = addressTextField.text ?? ""
        }
        
        if let cityTextField = self.lenderAddressView.viewWithTag(2) as? UITextField {
            form.lenderAddress = ("\(form.lenderAddress), \(cityTextField.text ?? "") ")
            form.city = cityTextField.text ?? ""
        }
        
        if let stateTextfield = self.lenderAddressView.viewWithTag(3) as? UITextField {
            form.lenderAddress = ("\(form.lenderAddress), \(stateTextfield.text ?? "") ")
        }
        
        if let zipTextField = self.lenderAddressView.viewWithTag(4) as? UITextField {
            form.lenderAddress = ("\(form.lenderAddress), \(zipTextField.text ?? "") ")
        }
        
        
        
        if let lAddressTextField = self.lendeeAddressView.viewWithTag(1) as? UITextField {
            form.lendeeAddress = lAddressTextField.text ?? ""
        }
        
        if let lCityTextField = self.lendeeAddressView.viewWithTag(2) as? UITextField {
            form.lendeeAddress = ("\(form.lendeeAddress), \(lCityTextField.text ?? "") ")
            form.city = lCityTextField.text ?? ""
        }
        
        if let lStateTextfield = self.lendeeAddressView.viewWithTag(3) as? UITextField {
            form.lendeeAddress = ("\(form.lendeeAddress), \(lStateTextfield.text ?? "") ")
        }
        
        if let lZipTextField = self.lendeeAddressView.viewWithTag(4) as? UITextField {
            form.lendeeAddress = ("\(form.lendeeAddress), \(lZipTextField.text ?? "") ")
        }
        
        
        
        form.lenderSignatureData =  lenderSignatureView.getSignatureData()
        form.lendeeSignatureData =  lendeeSignatureView.getSignatureData()
        
        RealmHelper.addForm(form: form)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtontapCancelled(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
    }
    @objc func saveButtontapDown(_ sender: AnyObject) -> Void{
        backButton.alpha = 0.5
    }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    mutating func insert(separator: Self, every n: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % n == 0 {
            insert(contentsOf: separator, at: index)
        }
    }

    func inserting(separator: Self, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }
}
