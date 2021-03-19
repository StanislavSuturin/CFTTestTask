//
//  NoteModel.swift
//  TestTaskCFT
//
//  Created by Станислав Сутурин on 15.03.2021.
//

import RealmSwift

class MyNote: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var date = ""
    @objc dynamic var content = ""
    

}

