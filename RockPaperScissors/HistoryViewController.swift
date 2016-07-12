//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Alex Perez on 7/10/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history: [RPSMatch]!
    
    // Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Identification of History TableView cell
        let CellID = "History"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath)
        
        let match = self.history[indexPath.row]
        
        //Text
        cell.textLabel!.text = victoryStatusDescription(match)
        
        //Detail
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
        
        
        return cell
    }
    
    //Displays if the user won or losr the match
    func victoryStatusDescription(match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
    
    //Dismiss History View Controller on OK
    @IBAction func dismissHistory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
