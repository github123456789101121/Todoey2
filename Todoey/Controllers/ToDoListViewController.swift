//
//  ViewController.swift
//  Todoey
//
//  Created by omashu on 1/28/18.
//  Copyright © 2018 Faith. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
   var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "find mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "buy eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "deystroy demogorgon"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {


       itemArray = items

      }
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
     
        //ternary value
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
       
        return cell
    }
   
    
    /// table view methood
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     ///   print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        

        
        tableView.reloadData()
            
     
        
        
       tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }

    
    /// add new items 
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add new item to list bazinga!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "add something dumb dumb", style:.default) { (action) in
            
            
            
            //what will happen when add button pressed uialert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
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

