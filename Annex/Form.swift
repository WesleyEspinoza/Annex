//
//  Form.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/10/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Form: Object{
    @objc dynamic var lender: String = ""
    @objc dynamic var lenderAddress: String = ""
    @objc dynamic var lendee: String = ""
    @objc dynamic var lendeeAddress: String = ""
    @objc dynamic var amount: String = ""

    @objc dynamic var creationDate: String = ""
    @objc dynamic var dueDate: String = ""
    @objc dynamic var State: String = ""
}
