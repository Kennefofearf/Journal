//
//  EntryDetailViewController.swift
//  Journal3
//
//  Created by Kenny Peterson on 5/25/17.
//  Copyright © 2017 Kenny Peterson. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }

    override func resignFirstResponder() -> Bool {
        return true
    }
        
    @IBAction func updateButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text, let text = bodyTextView.text else { return }
        
        if let entry = entry {
            
            EntryController.shared.update(entry: entry, title: title, text: text)
            
        } else {
            
            EntryController.shared.addEntryWith(title: title, text: text)
            
        }
        
        _ = self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func clearAllTextTapped(_ sender: UIButton) {
        
        bodyTextView.text = ""
        titleTextField.text = ""
        
    }
    
    func updateViews() {
        
        if let entry = entry {
            
            titleTextField.text = entry.title
            bodyTextView.text = entry.bodyText
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
