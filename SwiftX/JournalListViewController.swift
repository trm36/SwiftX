//
//  JournalListViewController.swift
//  SwiftX
//
//  Created by Taylor Mott on 9/8/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableViewDataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return JournalController.journals().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("journalCell") as UITableViewCell!
        
        let journal = JournalController.journals()[indexPath.row]
        
        cell.textLabel?.text = journal.title
        cell.detailTextLabel?.text = journal.tagline
        
        return cell
    }
    
    
    //MARK: - BarButton Methods
    
    @IBAction func addJournalButtonTapped(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Journal", message: "Add information about new journal.", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler( { (textField: UITextField) -> Void in
            textField.placeholder = "Journal Title"
        })
        
        alert.addTextFieldWithConfigurationHandler( { (textField: UITextField) -> Void in
            textField.placeholder = "Journal Description"
        })
        
        let action0 = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addAction(action0)

        
        let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
            let journal = JournalController.createJournal()
            
            if let textFields = alert.textFields {
                journal.title = textFields[0].text
                journal.tagline = textFields[1].text
            }
            
            JournalController.saveManagedObjectContext()
        }
        
        
        
        
        

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
