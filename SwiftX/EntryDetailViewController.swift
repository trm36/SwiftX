//
//  EntryDetailViewController.swift
//  SwiftX
//
//  Created by Taylor Mott on 9/8/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var entry: Entry?
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let entry = entry {
            bodyTextView.text = entry.body
            titleTextField.text = entry.title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        if let entry = entry {
            entry.title = titleTextField.text
            entry.body = bodyTextView.text
            
            
        } else if let journal = journal {
            let newEntry = JournalController.createEntryInJournal(journal)
            newEntry.title = titleTextField.text
            newEntry.body = bodyTextView.text
        }
    
        JournalController.saveManagedObjectContext()
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
