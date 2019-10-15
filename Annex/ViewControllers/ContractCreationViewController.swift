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
    
    
    
    let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.showsHorizontalScrollIndicator = true
        view.isPagingEnabled = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
    
        return control
    }()
    
    
    var amountView: UIView?
    
    
    let dueDateView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.layer.masksToBounds = true
        datePicker.layer.cornerRadius = 15
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.layer.cornerRadius = 15
        datePicker.layer.shadowOpacity = 0.5
        datePicker.layer.shadowRadius = 5
        datePicker.layer.shadowOffset = CGSize(width: 0, height: 5)
        datePicker.backgroundColor = .white
        
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "When is the money Due?"
        
        
        view.addSubview(datePicker)
        view.addSubview(lable)
        
        NSLayoutConstraint.activate([datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                                     datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                                     datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
                                     datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
                                     lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
                                     ])
        
        return view
    }()
    
    let lenderView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Who is Lending the money?"
        
        let textBox = UITextField()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    
    let lenderAddressView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "what is their Address"
        
        let addresstTextBox = UITextField()
        addresstTextBox.translatesAutoresizingMaskIntoConstraints = false
        addresstTextBox.placeholder = "Address"
        
        let citytTextBox = UITextField()
        citytTextBox.translatesAutoresizingMaskIntoConstraints = false
        citytTextBox.placeholder = "City"
        
        let zipCodeTextBox = UITextField()
        zipCodeTextBox.translatesAutoresizingMaskIntoConstraints = false
        zipCodeTextBox.placeholder = "Zip Code"
        zipCodeTextBox.keyboardType = .numberPad
        
        let stateTextBox = UITextField()
        stateTextBox.translatesAutoresizingMaskIntoConstraints = false
        stateTextBox.placeholder = "State"
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black
        let line1 = UIView()
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = .black
        let line2 = UIView()
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = .black
        let line3 = UIView()
        line3.translatesAutoresizingMaskIntoConstraints = false
        line3.backgroundColor = .black
        let line4 = UIView()
        line4.translatesAutoresizingMaskIntoConstraints = false
        line4.backgroundColor = .black
        
        view.addSubview(lable)
        view.addSubview(addresstTextBox)
        view.addSubview(citytTextBox)
        view.addSubview(stateTextBox)
        view.addSubview(zipCodeTextBox)
        
        view.addSubview(line)
        view.addSubview(line2)
        view.addSubview(line3)
        view.addSubview(line4)
        
        NSLayoutConstraint.activate([lable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
                                     lable.heightAnchor.constraint(equalToConstant: 25),
                                     
                                     
                                     addresstTextBox.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 50),
                                     addresstTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     addresstTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     addresstTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line.leadingAnchor.constraint(equalTo: addresstTextBox.leadingAnchor, constant: 0),
                                     line.trailingAnchor.constraint(equalTo: addresstTextBox.trailingAnchor, constant: 0),
                                     line.topAnchor.constraint(equalTo: addresstTextBox.bottomAnchor, constant: 0),
                                     line.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     citytTextBox.topAnchor.constraint(equalTo: addresstTextBox.bottomAnchor, constant: 50),
                                     citytTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     citytTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     citytTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     line2.leadingAnchor.constraint(equalTo: citytTextBox.leadingAnchor, constant: 0),
                                     line2.trailingAnchor.constraint(equalTo: citytTextBox.trailingAnchor, constant: 0),
                                     line2.topAnchor.constraint(equalTo: citytTextBox.bottomAnchor, constant: 0),
                                     line2.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     stateTextBox.topAnchor.constraint(equalTo: citytTextBox.bottomAnchor, constant: 50),
                                     stateTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     stateTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     stateTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line3.leadingAnchor.constraint(equalTo: stateTextBox.leadingAnchor, constant: 0),
                                     line3.trailingAnchor.constraint(equalTo: stateTextBox.trailingAnchor, constant: 0),
                                     line3.topAnchor.constraint(equalTo: stateTextBox.bottomAnchor, constant: 0),
                                     line3.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     zipCodeTextBox.topAnchor.constraint(equalTo: stateTextBox.bottomAnchor, constant: 50),
                                     zipCodeTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     zipCodeTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     zipCodeTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line4.leadingAnchor.constraint(equalTo: zipCodeTextBox.leadingAnchor, constant: 0),
                                     line4.trailingAnchor.constraint(equalTo: zipCodeTextBox.trailingAnchor, constant: 0),
                                     line4.topAnchor.constraint(equalTo: zipCodeTextBox.bottomAnchor, constant: 0),
                                     line4.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        return view
    }()
    
    
    
    
    let lendeeAddressView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "what is their Address"
        
        let addresstTextBox = UITextField()
        addresstTextBox.translatesAutoresizingMaskIntoConstraints = false
        addresstTextBox.placeholder = "Address"
        
        let citytTextBox = UITextField()
        citytTextBox.translatesAutoresizingMaskIntoConstraints = false
        citytTextBox.placeholder = "City"
        
        let zipCodeTextBox = UITextField()
        zipCodeTextBox.translatesAutoresizingMaskIntoConstraints = false
        zipCodeTextBox.placeholder = "Zip Code"
        zipCodeTextBox.keyboardType = .numberPad
        
        let stateTextBox = UITextField()
        stateTextBox.translatesAutoresizingMaskIntoConstraints = false
        stateTextBox.placeholder = "State"
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .black
        let line1 = UIView()
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = .black
        let line2 = UIView()
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = .black
        let line3 = UIView()
        line3.translatesAutoresizingMaskIntoConstraints = false
        line3.backgroundColor = .black
        let line4 = UIView()
        line4.translatesAutoresizingMaskIntoConstraints = false
        line4.backgroundColor = .black
        
        view.addSubview(lable)
        view.addSubview(addresstTextBox)
        view.addSubview(citytTextBox)
        view.addSubview(stateTextBox)
        view.addSubview(zipCodeTextBox)
        
        view.addSubview(line)
        view.addSubview(line2)
        view.addSubview(line3)
        view.addSubview(line4)
        
        NSLayoutConstraint.activate([lable.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
                                     lable.heightAnchor.constraint(equalToConstant: 25),
                                     
                                     
                                     addresstTextBox.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 50),
                                     addresstTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     addresstTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     addresstTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line.leadingAnchor.constraint(equalTo: addresstTextBox.leadingAnchor, constant: 0),
                                     line.trailingAnchor.constraint(equalTo: addresstTextBox.trailingAnchor, constant: 0),
                                     line.topAnchor.constraint(equalTo: addresstTextBox.bottomAnchor, constant: 0),
                                     line.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     citytTextBox.topAnchor.constraint(equalTo: addresstTextBox.bottomAnchor, constant: 50),
                                     citytTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     citytTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     citytTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     line2.leadingAnchor.constraint(equalTo: citytTextBox.leadingAnchor, constant: 0),
                                     line2.trailingAnchor.constraint(equalTo: citytTextBox.trailingAnchor, constant: 0),
                                     line2.topAnchor.constraint(equalTo: citytTextBox.bottomAnchor, constant: 0),
                                     line2.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     stateTextBox.topAnchor.constraint(equalTo: citytTextBox.bottomAnchor, constant: 50),
                                     stateTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     stateTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     stateTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line3.leadingAnchor.constraint(equalTo: stateTextBox.leadingAnchor, constant: 0),
                                     line3.trailingAnchor.constraint(equalTo: stateTextBox.trailingAnchor, constant: 0),
                                     line3.topAnchor.constraint(equalTo: stateTextBox.bottomAnchor, constant: 0),
                                     line3.heightAnchor.constraint(equalToConstant: 1),
                                     
                                     
                                     zipCodeTextBox.topAnchor.constraint(equalTo: stateTextBox.bottomAnchor, constant: 50),
                                     zipCodeTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     zipCodeTextBox.heightAnchor.constraint(equalToConstant: 25),
                                     zipCodeTextBox.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     
                                     line4.leadingAnchor.constraint(equalTo: zipCodeTextBox.leadingAnchor, constant: 0),
                                     line4.trailingAnchor.constraint(equalTo: zipCodeTextBox.trailingAnchor, constant: 0),
                                     line4.topAnchor.constraint(equalTo: zipCodeTextBox.bottomAnchor, constant: 0),
                                     line4.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        return view
    }()
    
    
    let lendeeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = .white
        
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Who is receiving the money?"
        
        let textBox = UITextField()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.placeholder = "John Doe"
        
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
    
    
    let lenderSignatureView: SwiftSignatureView = {
       let view = SwiftSignatureView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        view.maximumStrokeWidth = 12
        view.backgroundColor = .white
        return view
    }()
    
    let lendeeSignatureView: SwiftSignatureView = {
        let view = SwiftSignatureView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        view.backgroundColor = .white
        return view
    }()
    
    let lenderSignatureLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lender Signature"
        return label
    }()
    
    let lendeeSignatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lendee Signature"
        return label
    }()
    
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(nextButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(nextButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(nextButtontapDown), for: [.touchDown])
        return button
    }()
    
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(backButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(exitButtontapDown), for: [.touchDown])
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(backButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(backButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(backButtontapDown), for: [.touchDown])
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        button.layer.borderWidth = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(saveButtontapCancelled), for: [.touchCancel, .touchDragExit, .touchUpOutside])
        button.addTarget(self, action: #selector(saveButtontapUp), for: [.touchUpInside])
        button.addTarget(self, action: #selector(saveButtontapDown), for: [.touchDown])
        return button
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        amountView = createLableAndTextBoxView(lableText: "How much money is being lent?", placeHolderText: "525.00")
        
        let gradient = CAGradientLayer()
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [UIColor.init(hexString: "#00d4ff").cgColor, UIColor.init(hexString: "#0015ff").cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        scrollView.delegate = self;
        scrollView.backgroundColor = UIColor.clear;
        view.addSubview(scrollView)
        view.addSubview(nextButton)
        view.addSubview(backButton)
        view.addSubview(exitButton)
        scrollView.addSubview(saveButton)
        pageControl.currentPage = 0
        
        scrollView.addSubview(amountView!)
        scrollView.addSubview(dueDateView)
        scrollView.addSubview(lenderView)
        scrollView.addSubview(lenderAddressView)
        scrollView.addSubview(lendeeView)
        scrollView.addSubview(lendeeAddressView)
        scrollView.addSubview(lenderSignatureView)
        scrollView.addSubview(lendeeSignatureView)
        scrollView.addSubview(lenderSignatureLabel)
        scrollView.addSubview(lendeeSignatureLabel)
        
        let totalViews = scrollView.subviews.count - 2
        let viewWidth = view.bounds.width
        
        let width = viewWidth * CGFloat(totalViews)
        scrollView.contentSize = CGSize(width:width, height: 1)
        
        NSLayoutConstraint.activate([scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                                     scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     scrollView.heightAnchor.constraint(equalToConstant: viewH + 100),
                                     
                                     
                                     nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
                                     nextButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
                                     backButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
                                     exitButton.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: 0),
                                     exitButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     
                                     amountView!.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     amountView!.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
                                     amountView!.heightAnchor.constraint(equalToConstant: viewH),
                                     amountView!.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     dueDateView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     dueDateView.leadingAnchor.constraint(equalTo: amountView!.trailingAnchor, constant: 75),
                                     dueDateView.heightAnchor.constraint(equalToConstant: viewH),
                                     dueDateView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     
                                     lenderView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderView.leadingAnchor.constraint(equalTo: dueDateView.trailingAnchor, constant: 75),
                                     lenderView.heightAnchor.constraint(equalToConstant: viewH),
                                     lenderView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lenderAddressView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderAddressView.leadingAnchor.constraint(equalTo: lenderView.trailingAnchor, constant: 75),
                                     lenderAddressView.heightAnchor.constraint(equalToConstant: viewH + 150),
                                     lenderAddressView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lendeeView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeView.leadingAnchor.constraint(equalTo: lenderAddressView.trailingAnchor, constant: 75),
                                     lendeeView.heightAnchor.constraint(equalToConstant: viewH),
                                     lendeeView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lendeeAddressView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeAddressView.leadingAnchor.constraint(equalTo: lendeeView.trailingAnchor, constant: 75),
                                     lendeeAddressView.heightAnchor.constraint(equalToConstant: viewH + 150),
                                     lendeeAddressView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lenderSignatureView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderSignatureView.leadingAnchor.constraint(equalTo: lendeeAddressView.trailingAnchor, constant: 50),
                                     lenderSignatureView.heightAnchor.constraint(equalToConstant: viewH - 135),
                                     lenderSignatureView.widthAnchor.constraint(equalToConstant: viewW + 50),
                                     
                                     lenderSignatureLabel.bottomAnchor.constraint(equalTo: lenderSignatureView.topAnchor, constant: -1),
                                     lenderSignatureLabel.centerXAnchor.constraint(equalTo: lenderSignatureView.centerXAnchor),
                                     
                                     lendeeSignatureView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeSignatureView.leadingAnchor.constraint(equalTo: lenderSignatureView.trailingAnchor, constant: 25),
                                     lendeeSignatureView.heightAnchor.constraint(equalToConstant: viewH - 135),
                                     lendeeSignatureView.widthAnchor.constraint(equalToConstant: viewW + 50),
                                     
                                     lendeeSignatureLabel.bottomAnchor.constraint(equalTo: lendeeSignatureView.topAnchor, constant: -1),
                                     lendeeSignatureLabel.centerXAnchor.constraint(equalTo: lendeeSignatureView.centerXAnchor),
                                     
                                     
                                     saveButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     saveButton.leadingAnchor.constraint(equalTo: lendeeSignatureView.trailingAnchor, constant: 50),
                                     saveButton.heightAnchor.constraint(equalToConstant: viewH),
                                     saveButton.widthAnchor.constraint(equalToConstant: viewW),
                                     ])
        
        
        
    }
    
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
        
        form.lenderSignatureData =  lenderSignatureView.signature!.pngData()!
        form.lendeeSignatureData =  lendeeSignatureView.signature!.pngData()!
        
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
    
    
     func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        nextButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
    }
    
}
