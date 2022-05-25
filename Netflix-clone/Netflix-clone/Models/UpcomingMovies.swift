//
//  UpcomingMovies.swift
//  Netflix-clone
//
//  Created by Utkarsh Upadhyay on 21/05/22.
//

import Foundation

struct UpcomingMovieResponse: Codable {
    let results: [UpcomingMovies]
}

struct UpcomingMovies: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
    
}
