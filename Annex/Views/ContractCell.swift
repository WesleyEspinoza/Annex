//
//  Cell.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class ContractCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    let colorArr:[String] = ["#c44444","#4dc444","#c48444"]
    
    static var identifier: String = "ContractCell"
    var pan: UIPanGestureRecognizer!
    var deleteLabel1: UILabel!
    var deleteLabel2: UILabel!
    var dueDateObj: Date! {
        didSet {
            if let diffInDays = Calendar.current.dateComponents([.day], from: Date(), to: dueDateObj).day {
                if diffInDays <= 0 {
                    self.layer.borderColor = UIColor.init(hexString: "#c44444").cgColor
                }else if diffInDays < 10 {
                    self.layer.borderColor = UIColor.init(hexString: "#c48444").cgColor
                } else {
                    self.layer.borderColor = UIColor.init(hexString: "#4dc444").cgColor
                }
            } else {
                self.layer.borderColor = UIColor.init(hexString: "#c44444").cgColor
            }
        }
    }
    
    var nameLabel: UILabel = UILabel().newLabel(text: "John Doe's Contract", fontSize: 20, bold: true)
    
    let creationDateLabel: UILabel = UILabel().newLabel(text: "Creation Date: 01/09/2019", fontSize: 16)
    let dueDateLabel: UILabel = UILabel().newLabel(text: "Due Date: 01/19/2019", fontSize: 16)
    let arrowLabel: UILabel = UILabel().newLabel(text: "〉", fontSize: 35)
    let uniqueId: UILabel = UILabel().newLabel(text: " UNIQUE ID: 5SIF-DJDO-278J", fontSize: 10)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        // Customization
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        
        
        
        
        
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(creationDateLabel)
        self.contentView.addSubview(dueDateLabel)
        self.contentView.addSubview(arrowLabel)
        self.contentView.addSubview(uniqueId)
        
        
        
        
        
        
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            creationDateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            creationDateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            
            nameLabel.bottomAnchor.constraint(equalTo: creationDateLabel.topAnchor, constant: -15),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            
            
            dueDateLabel.topAnchor.constraint(equalTo: creationDateLabel.bottomAnchor, constant: 15),
            dueDateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            
            
            arrowLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            arrowLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            uniqueId.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            uniqueId.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        ])
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // prepares the cell fo reuse
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    // sets the alpha to 0.5 when a user presses and holds a view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.alpha = 0.5
        
    }
    // sets the alpha back once the user lets go
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1
    }
    
}

