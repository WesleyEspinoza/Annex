//
//  File.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/8/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    let colorArr:[String] = ["#35CDD8","#A5B557","#354E71"]
    
    static var identifier: String = "Cell"
    
    var buttonLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Layout views inside the cell
        
        let buttonLabel = UILabel(frame: .zero)
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(buttonLabel)
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: buttonLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: buttonLabel.centerYAnchor),
            ])
        
        // Customization
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.init(hexString: colorArr.randomElement()!)
        self.layer.cornerRadius = 15
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.buttonLabel = buttonLabel
        
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
    
}
