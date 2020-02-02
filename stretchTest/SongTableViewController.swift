//
//  SongTableViewController.swift
//  stretchTest
//
//  Created by 陳博軒 on 2020/2/2.
//  Copyright © 2020 Bozin. All rights reserved.
//

import UIKit
import SafariServices

class SongTableViewController: UITableViewController {
    
    @IBOutlet var songLabels: [UILabel]!
    
    
    var songs = [Song(name: "全世界的朋友都讓我失望", url: URL(string: "https://www.youtube.com/watch?v=CzWps-g7BUs")!), Song(name: "台北夜空下", url: URL(string: "https://www.youtube.com/watch?v=debWYJwOL-M")!), Song(name: "你是不是有點動心", url: URL(string: "https://www.youtube.com/watch?v=MJMfU2Od2T8")!), Song(name: "Things Things Things", url: URL(string: "https://www.youtube.com/watch?v=xxlxAFo2x1M")!), Song(name: "Fever", url: URL(string: "https://www.youtube.com/watch?v=bsilceYOgQA")!), Song(name: "小歇", url: URL(string: "https://www.youtube.com/watch?v=JQvaDYCJa4Q")!), Song(name: "撥接", url: URL(string: "https://www.youtube.com/watch?v=wlqJele6HHc")!), Song(name: "5 am", url: URL(string: "https://www.youtube.com/watch?v=ODXnAoO5a4U")!), Song(name: "Higher", url: URL(string: "https://www.youtube.com/watch?v=qUTccHIUpcc")!), Song(name: "原來的我", url: URL(string: "https://www.youtube.com/watch?v=EiGtnhdzIXc")!), Song(name: "Need U Now", url: URL(string: "https://www.youtube.com/watch?v=HzWIQw0_CTQ")!), Song(name: "七十億分之一", url: URL(string: "https://www.youtube.com/watch?v=jghZ-lhbpkU")!), Song(name: "夜晚", url: URL(string: "https://www.youtube.com/watch?v=xXoCH-1Qjhg")!)]
   
    let imageOriginalHeight: CGFloat = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (i, label) in songLabels.enumerated() {
            label.text = songs[i].name
        }
        tableView.contentInset = UIEdgeInsets(top: imageOriginalHeight, left: 0, bottom: 0, right: 0)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        let controller = SFSafariViewController(url: song.url)
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let controller = parent as? ImageViewController
        let originalOffsetY = -imageOriginalHeight
        let moveDistance = abs(scrollView.contentOffset.y - originalOffsetY)
        
        if scrollView.contentOffset.y < originalOffsetY {
            controller?.imageViewHeightConstraint.constant = imageOriginalHeight + moveDistance
            tableView.backgroundColor = UIColor.clear
        } else {
            controller?.imageViewHeightConstraint.constant = imageOriginalHeight
                
            tableView.backgroundColor = UIColor(white: 0, alpha: moveDistance / imageOriginalHeight)
        }
        
        
    }
    
}
