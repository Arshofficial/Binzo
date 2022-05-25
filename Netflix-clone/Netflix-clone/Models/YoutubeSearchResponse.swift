//
//  YoutubeSearchResponse.swift
//  Netflix-clone
//
//  Created by Utkarsh Upadhyay on 24/05/22.
//

import Foundation


struct YoutubeSearchResponse : Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IDVideoElement
}

struct IDVideoElement: Codable {
    let kind: String
    let videoId: String
}
