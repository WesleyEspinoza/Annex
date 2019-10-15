//
//  realmHelper.swift
//  Annex
//
//  Created by Wesley Espinoza on 1/13/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addForm(form: Form) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(form)
        }
    }
    
    static func deleteForm(form: Form) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(form)
        }
    }
    
    static func retrieveForm() -> Results<Form> {
        let realm = try! Realm()
        return realm.objects(Form.self).sorted(byKeyPath: "creationDate", ascending: false)
    }
}
