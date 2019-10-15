//
//  Cell.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell, UIGestureRecognizerDelegate {
    let colorArr:[String] = ["#c44444","#4dc444","#c48444"]
    
    static var identifier: String = "Cell"
    
    var pan: UIPanGestureRecognizer!
    var deleteLabel1: UILabel!
    var deleteLabel2: UILabel!
    
    var nameLable: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "John Doe's Contract"
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        return lable
    }()
    
    
    let moneyLabel: UILabel = {
       let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "$45.00"
        lable.font = UIFont.systemFont(ofSize: 20)
        return lable
    }()
    
    let uniqueIdLable: UILabel = {
       let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Unique ID: 8639-5838-2937"
        return lable
    }()
    
    
    let creationDateLable: UILabel = {
       let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Creation Date: 01/09/2019"
        lable.font = UIFont.systemFont(ofSize: 16)
        return lable
    }()
    
    let dueDateLable: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Due Date: 01/19/2019"
        lable.font = UIFont.systemFont(ofSize: 16)
        return lable
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(nameLable)
        self.contentView.addSubview(moneyLabel)
        self.contentView.addSubview(creationDateLable)
        self.contentView.addSubview(dueDateLable)
        
        self.layer.borderColor = UIColor.init(hexString: "#919191").cgColor
        self.layer.borderWidth = 1
        
        
        // Layout views inside the cell
        
        let arrowLable = UILabel(frame: .zero)
        arrowLable.translatesAutoresizingMaskIntoConstraints = false
        arrowLable.text = "〉"
        arrowLable.font = UIFont.systemFont(ofSize: 35)
        self.contentView.addSubview(arrowLable)
        
        
        
        
        
        
        // Aplying constraints
        NSLayoutConstraint.activate([ nameLable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
                                      nameLable.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
                                      
                                      
                                      moneyLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
                                      moneyLabel.topAnchor.constraint(equalTo: nameLable.topAnchor, constant: 15),
                                      
                                      
                                      creationDateLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 8),
                                      creationDateLable.leadingAnchor.constraint(equalTo: nameLable.leadingAnchor, constant: 0),
                                      
                                      
                                      dueDateLable.leadingAnchor.constraint(equalTo: creationDateLable.leadingAnchor, constant: 0),
                                      dueDateLable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                                      
                                      
                                      arrowLable.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
                                      arrowLable.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5)
                                      
            
            ])
        
        // Customization
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.init(hexString: colorArr.randomElement()!)
        self.layer.cornerRadius = 15
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        deleteLabel1 = UILabel()
        deleteLabel1.text = "delete"
        deleteLabel1.textColor = UIColor.white
        self.insertSubview(deleteLabel1, belowSubview: self.contentView)
        
        deleteLabel2 = UILabel()
        deleteLabel2.text = "delete"
        deleteLabel2.textColor = UIColor.white
        self.insertSubview(deleteLabel2, belowSubview: self.contentView)
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)

        
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

    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (pan.state == UIGestureRecognizer.State.changed) {
            let p: CGPoint = pan.translation(in: self)
            let width = self.contentView.frame.width
            let height = self.contentView.frame.height
            self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height);
            self.deleteLabel1.frame = CGRect(x: p.x - deleteLabel1.frame.size.width-10, y: 0, width: 100, height: height)
            self.deleteLabel2.frame = CGRect(x: p.x + width + deleteLabel2.frame.size.width, y: 0, width: 100, height: height)
        }
        
    }
    
    @objc func onPan(_ pan: UIPanGestureRecognizer) {
        if pan.state == UIGestureRecognizer.State.began {
            
        } else if pan.state == UIGestureRecognizer.State.changed {
            self.setNeedsLayout()
        } else {
            if abs(pan.velocity(in: self).x) > 500 {
                let collectionView: UICollectionView = self.superview as! UICollectionView
                let indexPath: IndexPath = collectionView.indexPathForItem(at: self.center)!
                collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(_:)), forItemAt: indexPath, withSender: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                })
            }
        }
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
