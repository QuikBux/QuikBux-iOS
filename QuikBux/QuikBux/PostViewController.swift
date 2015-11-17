//
//  PostViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/15/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false

        print("I AM IN THE POST HTININGIGN!!!")
        // Do any additional setup after loading the view        
        
//        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
//            //print(snapshot.value.objectForKey("author"))
//            print(snapshot)
//            if snapshot != nil {
//            self.posts.append(snapshot.value)
//            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.tableView.numberOfRowsInSection(0) + 1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Left)
//            }
//        })
//
        FBController.getPosts { (result) -> Void in
            //print("This is the result \(result)")
            self.posts = result
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func logoutButtonPressed(sender: UIButton) {
        FBController.logOut()
        self.performSegueWithIdentifier("postToHomeSegue", sender: self)
    }
    
    @IBAction func profileButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("postToProfileSegue", sender: self)
    }
    
    
    
    // MARK: Tableview Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return 5
        if posts != nil {
            return posts.count
            "There are more posts"
        } else {
            print("There are 0 posts")
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: PostTableViewCell = tableView.dequeueReusableCellWithIdentifier("postTableViewCell") as! PostTableViewCell
        //cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if let results = posts {
            let post = results.allValues[indexPath.row] as! NSDictionary
//            let post = results[indexPath.row]
            cell.titleLabel.text = post.valueForKey("jobType") as? String
            cell.descriptionLabel.text = post.valueForKey("description") as? String
            cell.posterNameLabel.text = post.valueForKey("name") as? String
        }
        
        return cell
    }
    
    // MARK: TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
