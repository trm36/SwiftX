//
//  EntryListViewController.swift
//  SwiftX
//
//  Created by Taylor Mott on 9/8/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController, UITableViewDataSource {
    
    var journal: Journal?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let journal = journal {
            title = journal.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView DataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let journal = journal {
            if let entries = journal.entries {
                return entries.count
            }
        }
        
        return Int(0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        if let journal = journal {
            if let entries = journal.entries {
                let entry = entries[indexPath.row] as! Entry
                
                cell.textLabel?.text = entry.title
                cell.detailTextLabel?.text = entry.body
            }
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
