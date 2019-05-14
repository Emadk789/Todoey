//
//  ViewController.swift
//  Todoey
//
//  Created by Emad Albarnawi on 09/09/1440 AH.
//  Copyright © 1440 Emad Albarnawi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    var defaults = UserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let item = defaults.array(forKey: "TodoListArray") as?  [Item] {
            itemArray = item
        }
        
        let newItem = Item()
        newItem.titel = "a"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.titel = "b"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.titel = "c"
        itemArray.append(newItem3)
        
        
    
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].titel
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    var checked = false
    //var checkedDictionary []
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.titel = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
           textField = alertTextField
        }
        alert.addAction(action)
        
       present(alert, animated: true, completion: nil)
       
        
    }
    
}

