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
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loudItems()
        
        
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
        self.saveItems()
        //        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New ToDo item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.titel = textField.text!
            
            self.itemArray.append(newItem)
            
            //            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.saveItems()
            
        }
        alert.addTextField { (alertTextField) in
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }
        catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    func loudItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!){
            
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            }catch{
                print(error)
            }
            
            
        }
    }
    
}

