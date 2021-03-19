//
//  NewNoteViewController.swift
//  TestTaskCFT
//
//  Created by Станислав Сутурин on 16.03.2021.
//

import UIKit

class NewNoteViewController: UITableViewController {
    
    var currentNote: MyNote?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var noteNameTF: UITextField!
    @IBOutlet weak var textNote: UITextView!
    @IBOutlet weak var countLabel: UILabel!

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(textDidChanged),
                    name: UITextView.textDidChangeNotification,
                    object: nil)

        saveButton.isEnabled = false
        textView.delegate = self
        textNote.text = ""
        countLabel.text = "0/500"
        
        setupEditScreen()
    }
    
    func saveNote(){
        
        let newNote = MyNote()
        
        let currentdate = Date()
        let df = DateFormatter()
        df.dateFormat = "dd MMMM yy HH:mm"
        if noteNameTF.text?.isEmpty == false {
        newNote.name = noteNameTF.text!
        } else{
            newNote.name = "Заметка"
        }
        newNote.date = df.string(from: currentdate)
        newNote.content = textNote.text
        if currentNote != nil {
            try! realm.write {
                currentNote?.name = newNote.name
                currentNote?.content = newNote.content
                currentNote?.date = newNote.date
            }
        } else {
        StorageManager.saveObject(newNote)
        }
    }
    
    private func setupEditScreen(){
        setupNavigationBar()
        if currentNote != nil {
            noteNameTF.text = currentNote?.name
            textNote.text = currentNote?.content
            
        }
    }
    
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = nil
        title = currentNote?.name
        saveButton.isEnabled = true
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}


extension NewNoteViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)/500"
        return textView.text.count + (text.count - range.length) <= 500
    }
    
    @objc private func textDidChanged() {
    
        if textNote.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    func getData() {
        
    }

   /* @objc func updateTextView(notification: Notification) {
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }*/
}


