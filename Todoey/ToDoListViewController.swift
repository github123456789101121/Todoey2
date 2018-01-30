//
//  ViewController.swift
//  Todoey
//
//  Created by omashu on 1/28/18.
//  Copyright © 2018 Faith. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
   var itemArray = ["find mike", "buy egos", "destroy demogorgon"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
    
        
       itemArray = items
            
        
    }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
   
    
    /// table view methood
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     ///   print(itemArray[indexPath.row])
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                    tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        else{
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
       tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }

    
    /// add new items 
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add new item to list bazinga!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "add something dumb dumb", style:.default) { (action) in
            
            
            
            //what will happen when add button pressed uialert
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey:  "TodoListArray")
            
            self.tableView.reloadData()
         
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "save the big fat ugly dumb whales"
            textField = alertTextField
           
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    

}

