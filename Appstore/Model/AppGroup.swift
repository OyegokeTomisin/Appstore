//
//  AppGroup.swift
//  Appstore
//
//  Created by OYEGOKE TOMISIN on 15/05/2019.
//  Copyright © 2019 com.OyegokeTomisin. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title : String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
