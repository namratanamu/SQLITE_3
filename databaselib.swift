//
//  databaselib.swift
//  todolistsqlite
//
//  Created by Felix 05 on 18/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import Foundation
import SQLite3
class databaselib
{
    static let shareObj = databaselib()
    var taskId = [String]()
    var taskName = [String]()
    func databasePath() -> String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path+"myDatabase.sqlite"
    }
    func executeQuery(query:String) ->Bool
    {
        var success: Bool = false
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        var dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                if sqlite3_step(stmt) == SQLITE_DONE
                {
                  success = true
                }
            
                else
                {
                    print("error in step:\(sqlite3_errmsg(stmt!))")
                }
            }
                else
                {
                    print("error in prepare:\(sqlite3_errmsg(stmt!))")
                }
        }
                else
                {
                    print("error in Open:\(sqlite3_errmsg(stmt!))")
                }
                return success
    }
    func selectall(query:String)
    {
       
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        var dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                taskName.removeAll()
                taskId.removeAll()
                while sqlite3_step(stmt) == SQLITE_ROW
                {
                let tname = sqlite3_column_text(stmt, 1)
                    var tasName = String(cString: tname!)
                    taskName.append(tasName)
                    let tid = sqlite3_column_text(stmt, 0)
                    var tasId = String(cString: tid!)
                    taskId.append(tasId)
                }
                print(taskId)
            }
                
            else
            {
                print("error in prepare:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("error in Open:\(sqlite3_errmsg(stmt!))")
        }
        
    }
    func createTable()
    {
        let createQuery = "create table if not exists taskTable(taskId text, taskName text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
    
        {
            print("table creation:success")
   
}
        else{
            print("table creation:failed")
        }
}
    }
