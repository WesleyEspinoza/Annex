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
                
                let pageWidth:CGFloat = self.scrollView.frame.width
                let contentOffset:CGFloat = self.scrollView.contentOffset.x
                let slideToX = contentOffset + pageWidth
                nextButton.isUserInteractionEnabled = false
                self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    @objc func nextButtontapCancelled(_ sender: AnyObject) -> Void{
        nextButton.alpha = 1
    }
    @objc func nextButtontapDown(_ sender: AnyObject) -> Void{
        nextButton.alpha = 0.5
    }
    
    @objc func backButtontapUp(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
        
        
        let pageWidth:CGFloat = self.scrollView.frame.width
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        
        let slideToX = (contentOffset - pageWidth)
        backButton.isUserInteractionEnabled = false
        self.scrollView.scrollRectToVisible(CGRect (x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    
    @objc func backButtontapCancelled(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
    }
    @objc func backButtontapDown(_ sender: AnyObject) -> Void{
        backButton.alpha = 0.5
    }
    
    
    @objc func saveButtontapUp(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
        let form = Form()
        
        for view in dueDateView.subviews {
            if let datePicker = view as? UIDatePicker {
                let dateFormatter = DateFormatter()
                let monthFormatter = DateFormatter()
                let dayFormatter = DateFormatter()
                let yearFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM d, yyyy"
                monthFormatter.dateFormat = "MMMM"
                dayFormatter.dateFormat = "d"
                yearFormatter.dateFormat = "yyyy"
                let strDate = dateFormatter.string(from: datePicker.date)
                let curDate = dateFormatter.string(from: NSDate() as Date)
                form.month = monthFormatter.string(from: datePicker.date)
                form.day = dayFormatter.string(from: datePicker.date)
                form.year = yearFormatter.string(from: datePicker.date)
                form.dueDate = strDate
                form.creationDate = curDate
                form.dateObj = datePicker.date
            }
            
        }
        
        
        for view in amountView!.subviews {
            if let textField = view as? UITextField {
                form.amount = "$\(textField.text ?? "")"
            }
        }
        
        for view in lenderView.subviews {
            if let textField = view as? UITextField {
                form.lender = textField.text ?? ""
            }
            
        }
        
        for view in lendeeView.subviews {
            if let textField = view as? UITextField {
                form.lendee = textField.text ?? ""
            }
        }
        for _ in lenderAddressView.subviews {
            if let textField0 = self.lenderAddressView.viewWithTag(0) as? UITextField {
                form.lenderAddress = textField0.text ?? ""
            }
            if let textField1 = self.lenderAddressView.viewWithTag(1) as? UITextField {
                form.lenderAddress = ("\(form.lenderAddress), \(textField1.text ?? "") ")
                form.city = textField1.text ?? ""
            }
            if let textField2 = self.lenderAddressView.viewWithTag(2) as? UITextField {
                form.lenderAddress = ("\(form.lenderAddress), \(textField2.text ?? "") ")
            }
            if let textField3 = self.lenderAddressView.viewWithTag(3) as? UITextField {
                form.lenderAddress = ("\(form.lenderAddress), \(textField3.text ?? "") ")
            }
        }
        
        for _ in lendeeAddressView.subviews {
            if let textField0 = self.lendeeAddressView.viewWithTag(0) as? UITextField {
                form.lendeeAddress = textField0.text ?? ""
            }
            if let textField1 = self.lendeeAddressView.viewWithTag(1) as? UITextField {
                form.lendeeAddress = ("\(form.lendeeAddress), \(textField1.text ?? "") ")
            }
            if let textField2 = self.lendeeAddressView.viewWithTag(2) as? UITextField {
                form.lendeeAddress = ("\(form.lendeeAddress), \(textField2.text ?? "") ")
            }
            if let textField3 = self.lendeeAddressView.viewWithTag(3) as? UITextField {
                form.lendeeAddress = ("\(form.lendeeAddress), \(textField3.text ?? "") ")
            }
        }
        
        form.lenderSignatureData =  lenderSignatureView.getSignatureData()
        form.lendeeSignatureData =  lendeeSignatureView.getSignatureData()
        
        self.dismiss(animated: true) {
            RealmHelper.addForm(form: form)
        }
    }
    
    @objc func saveButtontapCancelled(_ sender: AnyObject) -> Void{
        backButton.alpha = 1
    }
    @objc func saveButtontapDown(_ sender: AnyObject) -> Void{
        backButton.alpha = 0.5
    }
}
