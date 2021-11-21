//
//  DBHelper.swift
//  SportsGames
//
//  Created by Mac on 20/11/21.
//

import Foundation
import SQLite3

class DBHelper{
    
    var db : OpaquePointer?
    
    init() {
        db = createAndOpen()
        createTable()
    }
    
    private func createAndOpen() -> OpaquePointer? {
        var db : OpaquePointer?
        let dataBaseName = "sportDatabase.sqlite"
        do{
            let documentDir = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataBaseName)
            if sqlite3_open(documentDir.path, &db) == SQLITE_OK{
                print("Database opened successfully..")
                print("Database path \(documentDir.path)")
                return db
            }else{
                print("Unable to open Database")
            }
        }catch{
            print("Unable to get document Directory \(error.localizedDescription)")

        }
        return nil
    }
    
    private func createTable()  {
        var createStatment : OpaquePointer?
        let createStatementQuery = "CREATE TABLE IF NOT EXISTS FavoriteItems(sportName TEXT,itemName TEXT)"
        if sqlite3_prepare_v2(db, createStatementQuery, -1, &createStatment, nil) == SQLITE_OK{
            if sqlite3_step(createStatment) == SQLITE_DONE{
                print("create table succefully")
            }
            else{
                print("unable to create table")
            }}
        else{
            print("unable to prepared the query")
        }
    }
    
    typealias success = (_ title: String, _ mssg: String)->()
    func insertIntoFavItems(sportName:String,itemName : String, successClosure: success)  {
        var insertStatement : OpaquePointer?
        let insertStatementQuery = "INSERT INTO FavoriteItems(sportName,itemName) VALUES(?,?)"
        if sqlite3_prepare_v2(db, insertStatementQuery, -1, &insertStatement, nil) == SQLITE_OK{
            let sportNameNSStr = (String(sportName) as NSString).utf8String
            sqlite3_bind_text(insertStatement, 1, sportNameNSStr, -1, nil)
            let itemNameNSStr = (String(itemName) as NSString).utf8String
            sqlite3_bind_text(insertStatement, 2, itemNameNSStr, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("insert query successfully")
                successClosure("Succeed","Item added to Favorite.")
            }
            else{
                print("unable to insert a query")
            }
        }
    }
    
    func display() -> [Item]? {
        
        var selectStatement: OpaquePointer?
        let selectQuery = "SELECT * FROM FavoriteItems"
        var items = [Item]()
        if sqlite3_prepare_v2(db,selectQuery, -1, &selectStatement, nil) == SQLITE_OK{
            while sqlite3_step(selectStatement) == SQLITE_ROW {
                guard let sportName_CStr = sqlite3_column_text(selectStatement, 0) else{
                    print("Error while getting sportName from db!!!")
                    continue
                }
                let sportName = String(cString: sportName_CStr)
                guard let itemName_CStr = sqlite3_column_text(selectStatement, 1) else {
                    print("Error while getting itemName from db!!!")
                    continue
                }
                let itemName = String(cString: itemName_CStr)
                let item = Item(itemName: itemName, sportName: sportName)
                items.append(item)
            }
            sqlite3_finalize(selectStatement)
            return items
        }else{
            print("Unable to prepare select query!!!")
            return nil
        }
    }
    
}
