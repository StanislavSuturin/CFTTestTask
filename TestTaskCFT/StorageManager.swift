//
//  StorageManager.swift
//  TestTaskCFT
//
//  Created by Станислав Сутурин on 18.03.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ myNote: MyNote) {
        
        try! realm.write {
            realm.add(myNote)
        }
    }
    
    static func deleteObject(_ myNote: MyNote){
        try! realm.write {
            realm.delete(myNote)
        }
    }
}
