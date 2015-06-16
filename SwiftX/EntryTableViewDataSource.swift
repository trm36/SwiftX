//
//  EntryTableViewDataSource.swift
//  SwiftX
//
//  Created by Taylor Mott on 16 Jun 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class EntryTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedInstance.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("EntryCell") as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "EntryCell")
        }
        
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        if entry.title == "" {
            cell!.textLabel?.text = "No Title"
            cell!.textLabel?.font = UIFont.italicSystemFontOfSize(UIFont.systemFontSize())
            cell!.textLabel?.textColor = .grayColor()
        } else {
            cell!.textLabel?.text = entry.title
            cell?.textLabel?.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
            cell!.textLabel?.textColor = .blackColor()
        }
        
        cell!.detailTextLabel?.text = entry.bodyText
        
        return cell!
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.removeEntryAndSave(entry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
   
}
