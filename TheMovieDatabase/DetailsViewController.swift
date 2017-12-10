//
//  DetailsViewController.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/9/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var show: NSDictionary! = NSDictionary()
    //var show2: NSDictionary! = NSDictionary()
    @IBOutlet var posterimg: UIImageView!
    @IBOutlet var ratinglbl: UILabel!
    @IBOutlet var countlbl: UILabel!
    @IBOutlet var namelbl: UILabel!
    @IBOutlet var desclbl: UILabel!
    
    @IBOutlet var bgimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        
        ratinglbl.text = "Rating \(show["vote_average"] as! NSNumber)"
        countlbl.text = "Vote Count \(show["vote_count"] as! NSNumber)"
        namelbl.text = "\(show["name"] as! NSString)"
        desclbl.text = "\(show["overview"] as! NSString)"
        if let bgpath = show["backdrop_path"] as? String {
            let bgUrl = NSURL(string: baseUrl + bgpath)
            bgimg.setImageWith(bgUrl! as URL)
        }
        let posterpath = show["poster_path"] as! String
        let imageUrl = NSURL(string: baseUrl + posterpath)
        posterimg.setImageWith(imageUrl! as URL)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
