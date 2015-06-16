//
//  DetailViewContoller.swift
//  SwiftX
//
//  Created by Taylor Mott on 16 Jun 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textBodyTextView: UITextView!
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if entry != nil {
            self.title = self.entry!.title
            self.titleTextField.text = self.entry!.title
            self.textBodyTextView.text = self.entry!.bodyText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        
        if entry == nil {
            self.entry = EntryController.sharedInstance.createEntry()
        }
        
        self.entry!.title = self.titleTextField.text
        self.entry!.bodyText = self.textBodyTextView.text
        self.entry!.saveDate = NSDate()
        
        EntryController.sharedInstance.saveMOC()
        hideKeyboard()
    }

    @IBAction func clearButtonPressed() {
        
        let clearAlert = UIAlertController(title: "Clear Entry?", message: "Are you sure to clear all data in your entry?", preferredStyle: UIAlertControllerStyle.Alert)
        clearAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        clearAlert.addAction(UIAlertAction(title: "Clear Data", style: UIAlertActionStyle.Destructive, handler: { action -> Void in
            if self.entry != nil {
                self.entry!.title = ""
                self.entry!.bodyText = ""
                self.entry!.saveDate = NSDate()
            }
        
            self.titleTextField.text = ""
            self.textBodyTextView.text = ""
        
            EntryController.sharedInstance.saveMOC()
        }))
        
        self.navigationController?.presentViewController(clearAlert, animated: true, completion: nil)
    }
    
    //MARK: - Keyboard Hide
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.title = textField.text
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        if textView.text == "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda." {
            textView.text = ""
        }
        
        return true
    }
    
    func hideKeyboard() {
        self.titleTextField.resignFirstResponder()
        self.textBodyTextView.resignFirstResponder()
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
