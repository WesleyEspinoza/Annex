//
//  ContractCreationView.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import SimplePDF
import RealmSwift
import SwiftSignatureView

class ContractCreationViewController: UIViewController, UIScrollViewDelegate {
    
    
    var counter: Int = 0
    var offSet: Double = 22.5
    let viewH: CGFloat = 250
    let viewW: CGFloat = 300
    
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var amountView: CustomView!
    var dueDateView: CustomView!
    var lenderView: CustomView!
    var lenderAddressView: CustomView!
    var lendeeAddressView: CustomView!
    var lendeeView: CustomView!
    var datePicker: CustomView!
    var lenderSignatureView: CustomSignatureView!
    var lendeeSignatureView: CustomSignatureView!
    var nextButton: UIButton!
    var exitButton: UIButton!
    var backButton: UIButton!
    var saveButton: UIButton!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        setupViews()
        setupGradient()
        setupScrollView()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        nextButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
    }
    
}
