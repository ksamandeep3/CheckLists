//
//  AddItemViewControllerTableViewController.swift
//  CheckLists
//
//  Created by MacStudent on 2019-11-05.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController,UITextFieldDelegate{
   
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    var array = [1,2]
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func Cancel(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
   

    @IBAction func done(_ sender: Any)
    {
        // Add the following line
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated:true)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
     
    override func viewWillAppear(_ animated: Bool)
    {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
   func textField(_ textField: UITextField,
   shouldChangeCharactersIn range: NSRange,
   replacementString string: String) -> Bool {
    
   let oldText = textField.text!
    print("old text------>" + oldText)
    print("range------>" )
    print(range)
    print("String range---->" + string)
    
    let stringRange = Range(range, in:oldText)!
     print("String range---->")
    print(stringRange.lowerBound)
    print(stringRange.upperBound)
    
   let newText = oldText.replacingCharacters(in: stringRange,
   with: string)
    print("new text------>" + newText)
    print("\n\n\n\n")
    
   if newText.isEmpty {
   doneBarButton.isEnabled = false
   } else {
   doneBarButton.isEnabled = true
   }
   return true
   }

    
}
