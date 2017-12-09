//
//  showcell.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/8/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import UIKit

class showcell: UITableViewCell {

    @IBOutlet weak var posterview: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var overviewlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
