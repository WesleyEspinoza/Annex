//
//  Cell.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/9/19.
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
        
        let nameLable = UILabel(frame: .zero)
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(nameLable)
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: nameLable.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: nameLable.centerYAnchor),
            ])
        
        // Customization
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.init(hexString: colorArr.randomElement()!)
        self.layer.cornerRadius = 15
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
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


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

