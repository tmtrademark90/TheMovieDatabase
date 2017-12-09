//
//  ShowViewController.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/8/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import UIKit
import AFNetworking

class ShowViewController: UITableViewController {
    
    var shows: [NSDictionary]?

    @IBOutlet weak var showview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
        fetchShows()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        ->Int {
            return shows!.count
}
    func tableView(tableView: UITableView, cellForRowAtIndexPAth indexPath: NSIndexPath) ->UITableView {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "showcell", for: indexPath as IndexPath) as? showcell
        let cell = tableView.dequeueReusableCell(withIdentifier: "showcell", for: indexPath as IndexPath) as! showcell
        
        let show = shows![indexPath.row]
        let title = show ["title"] as! String
        let overview = show["overview"] as! String
        let posterpath = show["poster_path"] as! String
       
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = NSURL(string: baseUrl + posterpath)
        
//        cell.posterview.setImageWithUrl(imageUrl!)
        cell.posterview.setImageWith(imageUrl! as URL)
        cell.titlelabel.text = (title)
        cell.overviewlabel.text = (overview)
        
        
        print ("row /(indexPath.row)")
        return cell
    }
    
    func fetchShows(){
//        let apiKey = "d8a7063921e444c5d700832f8c07d3af"
//        let url = URL("https://api.themoviedb.org/3/tv/popular?api_key=d8a7063921e444c5d700832f8c07d3af")
        let apiKey = "d8a7063921e444c5d700832f8c07d3af"
        let url = URL("https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)&language=en-US&page=1")
        let request = URLRequest(
            url: url as URL,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        let task: URLSessionDataTask = session.dataTask( with: request, completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[])
                    as? NSDictionary{
                    print("response: \(responseDictionary)")
                    self.shows = responseDictionary["results"] as! [NSDictionary]
                    self.tableView.reloadData()
                }
            }
        })
        task.resume()
    }
}
    
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */














//let apiKey = "d8a7063921e444c5d700832f8c07d3af"
//let url = NSURL(https://api.themoviedb.org/3/tv/popular?api_key=\(apikey)&language=en-US&page=1)
//let request = URLRequest(
//    url: url as URL,
//    cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData,
//    timeoutInterval: 10)
//let session = URLSession(
//    configuration: URLSessionConfiguration.default,
//    delegate: nil,
//    delegateQueue: OperationQueue.main
//)
//let task: URLSessionDataTask = session.dataTask( with: request, completionHandler: { (dataOrNil, response, error) in
//    if let data = dataOrNil {
//        if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[])
//            as? NSDictionary{
//            print("response: \(responseDictionary)")
//        }
//    }
//})
//task.resume()
//
//
//












