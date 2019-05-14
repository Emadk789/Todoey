//
//  ViewController.swift
//  Todoey
//
//  Created by Emad Albarnawi on 09/09/1440 AH.
//  Copyright © 1440 Emad Albarnawi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["First Do", "The second to be done", "The theird"]
    var cell = UITableViewCell()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView.cellForRow(at: indexPath.row)
        //UITableViewCell.add
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    var checked = false
    //var checkedDictionary []
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark){
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
            checked = false
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

