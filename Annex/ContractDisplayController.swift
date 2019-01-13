//
//  ContractDisplayController.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/10/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import SimplePDF
import RealmSwift

class ContractDisplayController: UIViewController {
    
    var amount: String = ""
    var date: String = ""
    var lenderName: String = ""
    var lendeeName: String = ""
    var dueDate: String = ""
    var state: String = ""
    var lenderAddress: String = ""
    var lendeeAddress: String = ""
    var lenderSignature: UIImage?
    var lendeeSignature: UIImage?
    
    let textView:UITextView = {
        let view = UITextView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        return view
    }()
    
    
    override func viewDidLoad() {
        let loan: String = """
                                                    LOAN AGREEMENT
  
  
        \(String(describing: amount))                                                                                     Date: \(String(describing: date))
  
For value received, the undersigned \(String(describing: lendeeName)) (the "Borrower"), at \(String(describing: lendeeAddress)), promises to pay to the order of \(String(describing: lenderName)) (the "Lender"), at \(String(describing: lenderAddress)) (or at such other place as the Lender may designate in writing), the sum of \(String(describing: amount)) with no interest.
  
I. TERMS OF REPAYMENT
  
A. Payments
  
The unpaid principal shall be payable in full on \(String(describing: dueDate)) (the "Due Date").
  
B. Acceleration of Debt
  
If any payment obligation under this Note is not paid when due, the remaining unpaid principal balance and any accrued interest shall become due immediately at the option of the Lender.
  
II. PREPAYMENT
  
The Borrower reserves the right to prepay this Note (in whole or in part) prior to the Due Date with no prepayment penalty.
  
III. COLLECTION COSTS
  
If any payment obligation under this Note is not paid when due, the Borrower promises to pay all costs of collection, including reasonable attorney fees, whether or not a lawsuit is commenced as part of the collection process.
  
IV. DEFAULT
  
If any of the following events of default occur, this Note and any other obligations of the Borrower to the Lender, shall become due immediately, without demand or notice:
  
1) the failure of the Borrower to pay the principal and any accrued interest when due;
  
2) the liquidation, dissolution, incompetency or death of the Borrower;
  
3) the filing of bankruptcy proceedings involving the Borrower as a debtor;
  
4) the application for the appointment of a receiver for the Borrower;
  
5) the making of a general assignment for the benefit of the Borrower's creditors;
  
6) the insolvency of the Borrower;
  
7) a misrepresentation by the Borrower to the Lender for the purpose of obtaining or extending credit; or
  
8) the sale of a material portion of the business or assets of the Borrower.
  
  
V. SEVERABILITY OF PROVISIONS
  
If any one or more of the provisions of this Note are determined to be unenforceable, in whole or in part, for any reason, the remaining provisions shall remain fully operative.
  
VI. MISCELLANEOUS
  
All payments of principal and interest on this Note shall be paid in the legal currency of the United States. The Borrower waives presentment for payment, protest, and notice of protest and demand of this Note.
  
No delay in enforcing any right of the Lender under this Note, or assignment by Lender of this Note, or failure to accelerate the debt evidenced hereby by reason of default in the payment of a monthly installment or the acceptance of a past-due installment shall be construed as a waiver of the right of Lender to thereafter insist upon strict compliance with the terms of this Note without notice being given to Borrower. All rights of the Lender under this Note are cumulative and may be exercised concurrently or consecutively at the Lender's option.
  
This note may not be amended without the written approval of the holder.
  
  
VII. GOVERNING LAW
  
This Note shall be construed in accordance with the laws of the State of California.
  
  
VIII. SIGNATURES
  
This Note shall be signed by john doe and Erick Espinoza.
  
[SIGNATURE PAGE FOLLOWS]
  
IN WITNESS WHEREOF, this Agreement has been executed and delivered in the manner prescribed by law as of the date first written above.
  
Signed this _____ day of _______________, _____, at ___________________________, _________________________ .
  
  
Borrower:
\(String(describing: lendeeName))
  
  
By:____________________________________________________
\(String(describing: lendeeName))
  
  
Lender:
\(String(describing: lenderName))
  
  
By:____________________________________________________
\(String(describing:lenderName ))
"""
        
        view.addSubview(textView)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
                                     textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                                     textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
                                     textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15),
                                     textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),])
        
        textView.text = loan
    }
    

}

