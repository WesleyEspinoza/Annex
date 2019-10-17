//
//  CustomSignatureView.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/17/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//


import Foundation
import UIKit
import SwiftSignatureView

class CustomSignatureView: UIView{
    let signatureView = SwiftSignatureView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     func addLabel(text: String){
        addSignatureBox()
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        signatureView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: signatureView.topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: signatureView.leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: signatureView.trailingAnchor, constant: 0),
        ])
    }
    
     fileprivate func addSignatureBox(){
        signatureView.translatesAutoresizingMaskIntoConstraints = false
        signatureView.layer.borderWidth = 1
        signatureView.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        signatureView.maximumStrokeWidth = 10
        signatureView.backgroundColor = .white
        
        addSubview(signatureView)
        NSLayoutConstraint.activate([
            signatureView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            signatureView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            signatureView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            signatureView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            
        ])
        
    }
    
    func getSignatureData() -> Data?{
        if let signatureData = signatureView.signature!.pngData() {
            return signatureData
        } else {
            return nil
        }
    }
}
