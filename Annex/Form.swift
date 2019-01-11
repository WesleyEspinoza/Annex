//
//  Form.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/10/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import SwiftySignature

class Form {
    var lender: String = ""
    var lenderAddress: String = ""
    var lendee: String = ""
    var lendeeAddress: String = ""
    var amount: String = ""
    var lenderSignature: Signature?
    var lendeeSignature: Signature?
    var creationDate: String = ""
    var dueDate: String = ""
    var State: String = ""
}
