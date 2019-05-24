//
//  SearchResult.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 17/04/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    let formattedPrice: String
    let description: String
    let releaseNotes: String
}
