//
//  sportTableViewController.swift
//  410521313_2
//
//  Created by NDHU_CSIE on 2020/11/12.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class sportTableViewController: UITableViewController {
   
    var sportname = ["baseball", "basketball", "football", "other"]
    var sportimage = ["baseball", "basketball", "football", "other"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sportname.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! sportTableViewCell

        // Configure the cell...
        cell.nameLabel.text = sportname[indexPath.row]
        cell.sportImageView.image = UIImage(named: sportimage[indexPath.row])
        return cell
    }
    
    @IBOutlet weak var feedback: UILabel!
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let likeAction = UIContextualAction(style: .normal, title: "like"){
            (action,sourceView,CompletionHandler) in
            CompletionHandler(true)
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
           
            self.feedback.text = "I like " + self.sportname[indexPath.row]
            
        }
        let swipeconfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        return swipeconfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let dislikeAction = UIContextualAction(style: .normal, title: "dislike"){
            (action,sourceView,CompletionHandler) in
            CompletionHandler(true)
            
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
            self.feedback.text = " "
        }
        let swipeconfiguration = UISwipeActionsConfiguration(actions: [dislikeAction])
        return swipeconfiguration
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
