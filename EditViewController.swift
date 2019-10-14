//
//  EditViewController.swift
//  todolistsqlite
//
//  Created by Felix 05 on 21/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit



class EditViewController: UIViewController {
    var eid = String()
    
    var ename = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        EditId.text = eid
        EditName.text = ename
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var EditId: UITextField!
    
    @IBOutlet weak var EditName: UITextField!
  
    @IBAction func Delete(_ sender: UIButton) {
        let DeleteQuery = "delete from taskTable where taskId = '\(EditId.text!)'"
        let issuccess = databaselib.shareObj.executeQuery(query:DeleteQuery )
        if issuccess
        {
            print("Delete success")
        }
        else
        {
            print("Delete failed")
        }
    
    
}

    
func update(_ sender: UIButton) {
        
    let UpdateQuery = "update taskTable set taskName = '\(EditName.text!)' where taskId = '\(EditId.text!)'"
        let issuccess = databaselib.shareObj.executeQuery(query:UpdateQuery )
       if issuccess
        {
            print("Update success")
        }
        else
        {
           print("Update failed")
        }
    }
        


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
