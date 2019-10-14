//
//  ViewController.swift
//  todolistsqlite
//
//  Created by Felix 05 on 18/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit
var allTaskNames = [String]()
var allTaskIds = [String]()




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allTaskNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.detailTextLabel?.text = allTaskIds[indexPath.row]
        cell.textLabel?.text = allTaskNames[indexPath.row]
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
     
        
        let next1 = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        next1.eid = (cell?.detailTextLabel?.text)!
        next1.ename = (cell?.textLabel?.text)!
        navigationController?.pushViewController(next1, animated: true
        )
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let selectQuery = "select taskId, taskName from taskTable"
        databaselib.shareObj.selectall(query: selectQuery)
        allTaskNames = databaselib.shareObj.taskName
        allTaskIds = databaselib.shareObj.taskId
        tableview.reloadData()
        print(allTaskNames)
        print(allTaskIds)
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        
        
        let next = storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        navigationController?.pushViewController(next, animated: true)
    }
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

