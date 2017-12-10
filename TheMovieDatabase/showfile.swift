//
//  showfile.swift
//  TheMovieDatabase
//
//  Created by Terry McCart on 12/9/17.
//  Copyright © 2017 Terry McCart. All rights reserved.
//

import Foundation



struct showstuff:Decodable {
    let name: String
    let popularity: Int
    let vote_count: Int
    let overview: String
    let poster_path: String
    let backdrop_path: String
}
