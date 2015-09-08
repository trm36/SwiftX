//
//  JournalController.swift
//  SwiftX
//
//  Created by Taylor Mott on 9/8/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import Foundation
import CoreData

class JournalController {
    
    static func createJournal() -> Journal {
        let journal = NSEntityDescription.insertNewObjectForEntityForName("Journal", inManagedObjectContext: Stack.sharedInstance().managedObjectContext) as! Journal
    
        return journal
    }
    
    static func journals() -> [Journal] {
        let request = NSFetchRequest(entityName: "Journal")
        
        if let journalArray = try? Stack.sharedInstance().managedObjectContext.executeFetchRequest(request) {
            return journalArray as! [Journal]
        }
        return []
    }
    //Update
    static func saveManagedObjectContext() {
        if let success = try? Stack.sharedInstance().managedObjectContext.save() {
            print("SAVE MOC \(success)")
        }
    }
    
    static func deleteJournal(journal: Journal) {
        if let managedObjectContext = journal.managedObjectContext {
            managedObjectContext.delete(journal)
        }
    }
    
    static func createEntryInJournal(journal: Journal) -> Entry {
        let entry = NSEntityDescription.insertNewObjectForEntityForName("Entry", inManagedObjectContext: Stack.sharedInstance().managedObjectContext) as! Entry
        
        entry.journal = journal
        
        return entry
    }
    
    static func deleteEntry(entry: Entry) {
        if let managedObjectContext = entry.managedObjectContext {
            managedObjectContext.delete(entry)
        }
    }
    
}
