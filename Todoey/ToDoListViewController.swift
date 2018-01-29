//
//  ViewController.swift
//  Todoey
//
//  Created by omashu on 1/28/18.
//  Copyright © 2018 Faith. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["find mike", "buy egos", "destroy demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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

    
    
    
    
    
    
    
    
    

}

