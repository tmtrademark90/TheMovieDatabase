//
//  show2cell.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/10/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import UIKit

class show2cell: UITableViewCell {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var overviewlbl: UILabel!
    @IBOutlet weak var img2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
