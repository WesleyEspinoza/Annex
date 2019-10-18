//
//  ContractCreationCell.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/18/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class ContractCreationCell: UICollectionViewCell {
    static var cellId = "ContractCreationCell"
    
    var vh: CGFloat = 0{
        didSet {
            NSLayoutConstraint.activate([
                mainContentView.heightAnchor.constraint(equalToConstant: vh)
            ])
        }
    }
    var vw: CGFloat = 0 {
        didSet {
    
            NSLayoutConstraint.activate([
                mainContentView.widthAnchor.constraint(equalToConstant: vw),

            ])
        }
    }
    
    var mainContentView: UIView! = nil {
        didSet {
            self.addSubview(mainContentView)
            NSLayoutConstraint.activate([
                mainContentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                mainContentView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

    }
    
}
