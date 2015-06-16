//
//  EntryController.swift
//  SwiftX
//
//  Created by Taylor Mott on 16 Jun 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit
import CoreData

class EntryController: NSObject {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    static let sharedInstance = EntryController()
    
    func createEntry() -> Entry {
        
        let entry = NSEntityDescription.insertNewObjectForEntityForName("Entry", inManagedObjectContext: appDelegate.managedObjectContext!) as! Entry
        
        return entry
    }
    
    var entries:[Entry] {
        get {
            return appDelegate.managedObjectContext?.executeFetchRequest(NSFetchRequest(entityName: "Entry"), error: nil) as! [Entry]
        }
    }
    
    func removeEntryAndSave(entry: Entry) {
        entry.managedObjectContext?.deleteObject(entry)
        saveMOC()
    }
    
    func saveMOC() {
        appDelegate.managedObjectContext?.save(nil)
    }
   
}
