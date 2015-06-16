//
//  ViewController.swift
//  SwiftX
//
//  Created by Taylor Mott on 16 Jun 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Entry" {
            let dvc = segue.destinationViewController as! DetailViewController
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView .indexPathForCell(cell)
            
            dvc.entry = EntryController.sharedInstance.entries[indexPath!.row]
        }
    }

}

