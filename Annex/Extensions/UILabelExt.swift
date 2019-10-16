//
//  UILabelExt.swift
//  Annex
//
//  Created by Wesley Espinoza on 10/15/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    public func newLabel(text: String, fontSize: CGFloat, bold: Bool = false) -> UILabel{
        let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = text
        if (bold) {
            lable.font = UIFont.boldSystemFont(ofSize: fontSize)
        } else {
            lable.font = UIFont.systemFont(ofSize: fontSize)
        }
        
        return lable
    }
}
