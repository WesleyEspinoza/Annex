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
        

        
        
        amountView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        amountView.addLabel(text: "How much is being lent?")
        let moneyLabel = UILabel()
        moneyLabel.text = "$ "
        amountView.addTextbox(placeHolderText: "152.00", keyboardType: .numbersAndPunctuation, 1, leftView: moneyLabel)
        
        
        dueDateView = CustomDatePicker(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        dueDateView.addLabel(text: "When is the money due?")
        
        
        lenderView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lenderView.addLabel(text: "Who is lending the money?")
        lenderView.addTextbox(placeHolderText: "John Doe", keyboardType: .default, 1)
        
        
        
        lenderAddressView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH + 50))
        lenderAddressView.addLabel(text: "Lender's address")
        lenderAddressView.addTextbox(placeHolderText: "555 Yellow Brick Rd", keyboardType: .default, 1)
        lenderAddressView.addTextbox(placeHolderText: "Kansas City", keyboardType: .default, 2)
        lenderAddressView.addTextbox(placeHolderText: "Kansas", keyboardType: .default, 3)
        lenderAddressView.addTextbox(placeHolderText: "31658", keyboardType: .default, 4)
        
        
        
        
        lendeeAddressView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH + 50))
        lendeeAddressView.addLabel(text: "Lendee's address")
        lendeeAddressView.addTextbox(placeHolderText: "556 Yellow Brick Rd", keyboardType: .default, 1)
        lendeeAddressView.addTextbox(placeHolderText: "Kansas City", keyboardType: .default, 2)
        lendeeAddressView.addTextbox(placeHolderText: "Kansas", keyboardType: .default, 3)
        lendeeAddressView.addTextbox(placeHolderText: "31658", keyboardType: .default, 4)
        
        
        lendeeView = CustomView(frame: CGRect(x: 0, y: 0, width: viewW, height: viewH))
        lendeeView.addLabel(text: "Who is receiving the money?")
        lendeeView.addTextbox(placeHolderText: "John Doe", keyboardType: .default, 1)
        
        
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
        
        views.append(lenderView)
        views.append(lenderAddressView)
        views.append(amountView)
        views.append(lendeeView)
        views.append(lendeeAddressView)
        views.append(lendeeSignatureView)
        views.append(lenderSignatureView)
        
        pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = views.count
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.4, green: 0.137254902, blue: 0.8196078431, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6146181841, green: 0.4736413815, blue: 0.9775631096, alpha: 1)
    }
    
    func setupGradient(){
        let gradient = CAGradientLayer()
        
        gradient.frame = UIScreen.main.bounds
        gradient.colors = [UIColor.init(hexString: "#00d4ff").cgColor, UIColor.init(hexString: "#0015ff").cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setupCollectionView(){
        collectionView.delegate = self;
        collectionView.backgroundColor = UIColor.white;
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ContractCreationCell.self, forCellWithReuseIdentifier: ContractCreationCell.cellId)
        collectionView.isPagingEnabled = true
        view.addSubview(nextButton)
        view.addSubview(backButton)
        view.addSubview(exitButton)

        
        NSLayoutConstraint.activate([
                                     nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
                                     nextButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -125),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
                                     backButton.widthAnchor.constraint(equalToConstant: 75),
                                     
                                     
                                     exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
                                     exitButton.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: 0),
                                     exitButton.widthAnchor.constraint(equalToConstant: 75),
        ])
    }
}


extension ContractCreationViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return views.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContractCreationCell.cellId, for: indexPath) as! ContractCreationCell
        cell.mainContentView = views[indexPath.row]
        cell.vh = views[indexPath.row].bounds.height
        cell.vw = views[indexPath.row].bounds.width
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.bounds.height / 2)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
}

