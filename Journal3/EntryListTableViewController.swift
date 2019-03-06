//
//  EntryListTableViewController.swift
//  Journal3
//
//  Created by Kenny Peterson on 5/25/17.
//  Copyright © 2017 Kenny Peterson. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalEntry", for: indexPath)

        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addEntryDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let entry = EntryController.shared.entries[indexPath.row]
                
                let entryDetailVC = segue.destination as? EntryDetailViewController
                
                entryDetailVC?.entry = entry
                
            }
            
        } else if segue.identifier == "editEntryDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let entry = EntryController.shared.entries[indexPath.row]
                
                let entryDetailVC = segue.destination as? EntryDetailViewController
                
                entryDetailVC?.entry = entry
                
            }
            
        }
        
    }

}
