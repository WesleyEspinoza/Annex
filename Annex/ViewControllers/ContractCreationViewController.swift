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

class ContractCreationViewController: UICollectionViewController {
    
    
    var counter: Int = 0
    var offSet: Double = 22.5
    let viewH: CGFloat = 250
    let viewW: CGFloat = 300

    var amountView: CustomView!
    var dueDateView: CustomDatePicker!
    var lenderView: CustomView!
    var lenderAddressView: CustomView!
    var lendeeAddressView: CustomView!
    var lendeeView: CustomView!
    var lenderSignatureView: CustomSignatureView!
    var lendeeSignatureView: CustomSignatureView!
    var nextButton: UIButton!
    var exitButton: UIButton!
    var backButton: UIButton!
    var saveButton: UIButton!
    var views: [UIView] = []
    var pageControl: UIPageControl!
    override func viewDidLoad() {
        super .viewDidLoad()
        setupViews()
        setupGradient()
        setupCollectionView()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        
    }
    
}
