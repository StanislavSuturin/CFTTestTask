//
//  MainTableViewController.swift
//  TestTaskCFT
//
//  Created by Станислав Сутурин on 15.03.2021.
//

import UIKit
import RealmSwift

class MainTableViewController: UITableViewController {

    var notes: Results<MyNote>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = realm.objects(MyNote.self)
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.isEmpty ? 0 : notes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath) as! CustomTableViewCell
        
        let note = notes[indexPath.row]
        
        
        cell.date.text = note.date
        cell.nameOfTheNote.text = note.name
        
        cell.backgroundColor = .purple
        //cell.layer.cornerRadius = 150
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let note = notes[indexPath.row]
        func deleteAction(forRowAt indexPath: IndexPath)-> UIContextualAction{
            return UIContextualAction(style: .destructive, title: "Delete") { (_,_,_) in
            StorageManager.deleteObject(note)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        return UISwipeActionsConfiguration(actions: [deleteAction(forRowAt: indexPath)])
    }
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let note = notes[indexPath.row]
            let newNoteVC = segue.destination as! NewNoteViewController
            newNoteVC.currentNote = note
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
        guard let newNoteVC = segue.source as? NewNoteViewController else {
            return
        }
        newNoteVC.saveNote()
        tableView.reloadData()
    }
    
}
