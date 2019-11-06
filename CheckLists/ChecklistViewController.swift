//
//  ViewController.swift
//  CheckLists
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit



class ChecklistViewController: UITableViewController
{
   var items: [ChecklistItem]
    
   let row0text = "Walk the dog"
   let row1text = "Brush teeth"
   let row2text = "Learn iOS development"
   let row3text = "Soccer practice"
  let row4text = "Eat ice cream"

    
    
    
    
    required init?(coder aDecoder: NSCoder)
    {
        
    items = [ChecklistItem]()
        
    let row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = false
    items.append(row0item)
        
    let row1item = ChecklistItem()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    items.append(row1item)
        
    let row2item = ChecklistItem()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    items.append(row2item)
        
    let row3item = ChecklistItem()
    row3item.text = "Soccer practice"
    row3item.checked = false
     items.append(row3item)
        
    let row4item = ChecklistItem()
    row4item.text = "Eat ice cream"
    row4item.checked = true
     items.append(row4item)
        
    super.init(coder : aDecoder)
    }
    
   
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell
    
    {
       
        
    let cell = tableView.dequeueReusableCell(
    withIdentifier: "ChecklistItem",
    for: indexPath)
        let item = items[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
          
        label.text = item.text
        configureCheckmark(for: cell, at: indexPath)
        return cell
        }
    
       


    override func tableView(_ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath)
    {
        
//        switch indexPath.row {
//        case 0:
//            <#code#>
//        default:
//            <#code#>
//        }
//
        
        
    if let cell = tableView.cellForRow(at: indexPath)
    {
    let item = items[indexPath.row]
    item.checked = !item.checked
    configureCheckmark(for: cell, at: indexPath)
    }
    tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,
       forRowAt indexPath: IndexPath) {
       // 1
       items.remove(at: indexPath.row)
       // 2
       let indexPaths = [indexPath]
       tableView.deleteRows(at: indexPaths, with: .automatic)
       }
    
    
    
    
    func configureCheckmark(for cell: UITableViewCell,at indexPath: IndexPath) {
   let item = items[indexPath.row]
   if item.checked {
   cell.accessoryType = .checkmark
   } else {
   cell.accessoryType = .none
   }
    }
    
    @IBAction func addItem()
    {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    
}
