//
//  ContractCreationView.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class ContractCreationViewController: UIViewController {
    
    let lenderView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.backgroundColor = UIColor.init(hexString: "#72a8ff")
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(lenderView)
        
        NSLayoutConstraint.activate([lenderView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     lenderView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
                                     lenderView.heightAnchor.constraint(equalToConstant: 250),
                                     lenderView.widthAnchor.constraint(equalToConstant: 350)])
    }
    
}
