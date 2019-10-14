//
//  nextViewController.swift
//  todolistsqlite
//
//  Created by Felix 05 on 18/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var textid: UITextField!
    
    @IBOutlet weak var textname: UITextField!
    
    @IBAction func save(_ sender: UIButton) {
        let insertQuery = "insert into taskTable(taskId, taskName) values ('\(textid.text!)','\(textname.text!)')"
        let issuccess = databaselib.shareObj.executeQuery(query:insertQuery )
        if issuccess
        {
            print("insert success")
        }
        else
        {
            print("insert failed")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
