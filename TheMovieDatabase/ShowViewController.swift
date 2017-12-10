//
//  ShowViewController.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/8/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//
// "This product uses the TMDb API but is not endorsed or certified by TMDb." 

import UIKit
import AFNetworking

class ShowViewController: UITableViewController {
    
    var shows: [NSDictionary]?
    @IBOutlet weak var showview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Calls the function to retrieve shows from the movie database. Starting on page 1.
        fetchShows(page: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// Set the amount of rows for table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = self.shows?.count {
        return count
    } else {
        return 0
    }
}
  // Set the cell information in the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showcell", for: indexPath as IndexPath) as! showcell

        let show = shows![indexPath.row]
        let title = show ["name"] as! String
        let overview = show["overview"] as! String
        let posterpath = show["poster_path"] as! String
       
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = NSURL(string: baseUrl + posterpath)
        
        cell.posterview.setImageWith(imageUrl! as URL)
        cell.titlelabel.text = (title)
        cell.overviewlabel.text = (overview)
        
        cell.layoutIfNeeded()
        
        return cell
    }
    // Goes through and grabs the new information to update the page information.
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let element = shows!.count - 5
        let current_page = shows!.count / 20
        if indexPath.row == element {
            fetchShows(page: current_page + 1)
        }
    }
   
    // move to details page
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
   // sets show to display the correct show data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let index = tableView.indexPathForSelectedRow
            let vc = segue.destination as! DetailsViewController
            vc.show = shows![(index?.row)!]
        }
    }
    
    // Fucntion that grabs show information and allows the api page to be updated.
    func fetchShows(page: Int){
        let apiKey = "d8a7063921e444c5d700832f8c07d3af"
        let url = URL(string:"https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)&language=en-US&page=\(page)")
        let request = URLRequest(
            url: url!,
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
                    if (page == 1) {
                        self.shows = (responseDictionary["results"] as! [NSDictionary])
                    } else {
                        for show in responseDictionary["results"] as! [NSDictionary] {
                            self.shows!.append(show)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        })
        task.resume()
    }
}
