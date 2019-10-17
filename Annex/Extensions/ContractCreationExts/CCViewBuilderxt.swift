//
//  ContractCreationExtensions.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import SwiftSignatureView

extension ContractCreationViewController {
    func setupViews() {
        scrollView = {
            let view = UIScrollView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.isScrollEnabled = false
            view.showsHorizontalScrollIndicator = true
            view.isPagingEnabled = false
            view.isUserInteractionEnabled = true
            return view
        }()
        
        pageControl = {
            let control = UIPageControl()
            return control
        }()
        
        
        amountView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        amountView.addLabel(text: "How much is being lent?")
        let moneyLabel = UILabel()
        moneyLabel.text = "$ "
        amountView.addTextbox(placeHolderText: "152.00", keyboardType: .numbersAndPunctuation, leftView: moneyLabel)
        
        
        dueDateView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        dueDateView.addLabel(text: "When is the money due?")
        dueDateView.addDatePicker()
        
        
        lenderView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lenderView.addLabel(text: "Who is lending the money?")
        lenderView.addTextbox(placeHolderText: "John Doe", keyboardType: .default)
        
        
        
        lenderAddressView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lenderAddressView.addLabel(text: "Lender's address")
        lenderAddressView.addTextbox(placeHolderText: "555 Yellow Brick Rd", keyboardType: .default, 0)
        lenderAddressView.addTextbox(placeHolderText: "Kansas City", keyboardType: .default, 1)
        lenderAddressView.addTextbox(placeHolderText: "Kansas", keyboardType: .default, 2)
        lenderAddressView.addTextbox(placeHolderText: "31658", keyboardType: .default, 3)
        
        
        
        
        lendeeAddressView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lendeeAddressView.addLabel(text: "Lendee's address")
        lendeeAddressView.addTextbox(placeHolderText: "556 Yellow Brick Rd", keyboardType: .default, 0)
        lendeeAddressView.addTextbox(placeHolderText: "Kansas City", keyboardType: .default, 1)
        lendeeAddressView.addTextbox(placeHolderText: "Kansas", keyboardType: .default, 2)
        lendeeAddressView.addTextbox(placeHolderText: "31658", keyboardType: .default, 3)
        
        
        lendeeView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lendeeView.addLabel(text: "Who is receiving the money?")
        lendeeView.addTextbox(placeHolderText: "John Doe", keyboardType: .default)
        
        
        lenderSignatureView = CustomSignatureView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lenderSignatureView.addLabel(text: "Lender's signature")
        
        lendeeSignatureView = CustomSignatureView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lendeeSignatureView.addLabel(text: "Lendee's signature")
        
        
        nextButton = {
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
        
        
        exitButton = {
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
        
        backButton = {
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
        
        saveButton = {
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
    }
    
    func setupGradient(){
        let gradient = CAGradientLayer()
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [UIColor.init(hexString: "#00d4ff").cgColor, UIColor.init(hexString: "#0015ff").cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setupScrollView(){
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
        
        let totalViews = scrollView.subviews.count
        let viewWidth = view.bounds.width
        
        let width = viewWidth * CGFloat(totalViews)
        scrollView.contentSize = CGSize(width:width, height: 1)
        
        NSLayoutConstraint.activate([scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                                     scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     scrollView.heightAnchor.constraint(equalToConstant: self.view.bounds.height),
                                     
                                     
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
                                     dueDateView.leadingAnchor.constraint(equalTo: amountView!.trailingAnchor, constant: 25),
                                     dueDateView.heightAnchor.constraint(equalToConstant: viewH),
                                     dueDateView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     
                                     lenderView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderView.leadingAnchor.constraint(equalTo: dueDateView.trailingAnchor, constant: 25),
                                     lenderView.heightAnchor.constraint(equalToConstant: viewH),
                                     lenderView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lenderAddressView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderAddressView.leadingAnchor.constraint(equalTo: lenderView.trailingAnchor, constant: 25),
                                     lenderAddressView.heightAnchor.constraint(equalToConstant: viewH + 150),
                                     lenderAddressView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lendeeView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeView.leadingAnchor.constraint(equalTo: lenderAddressView.trailingAnchor, constant: 25),
                                     lendeeView.heightAnchor.constraint(equalToConstant: viewH),
                                     lendeeView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lendeeAddressView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeAddressView.leadingAnchor.constraint(equalTo: lendeeView.trailingAnchor, constant: 25),
                                     lendeeAddressView.heightAnchor.constraint(equalToConstant: viewH + 150),
                                     lendeeAddressView.widthAnchor.constraint(equalToConstant: viewW),
                                     
                                     
                                     lenderSignatureView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lenderSignatureView.leadingAnchor.constraint(equalTo: lendeeAddressView.trailingAnchor, constant: 25),
                                     lenderSignatureView.heightAnchor.constraint(equalToConstant: viewH - 135),
                                     lenderSignatureView.widthAnchor.constraint(equalToConstant: viewW + 50),
                                     
                                     
                                     lendeeSignatureView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     lendeeSignatureView.leadingAnchor.constraint(equalTo: lenderSignatureView.trailingAnchor, constant: 25),
                                     lendeeSignatureView.heightAnchor.constraint(equalToConstant: viewH - 135),
                                     lendeeSignatureView.widthAnchor.constraint(equalToConstant: viewW + 50),
                                     
                                     
                                     saveButton.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
                                     saveButton.leadingAnchor.constraint(equalTo: lendeeSignatureView.trailingAnchor, constant: 25),
                                     saveButton.heightAnchor.constraint(equalToConstant: viewH),
                                     saveButton.widthAnchor.constraint(equalToConstant: viewW),
        ])
    }
}
