//
//  UserData.swift
//  Bitpicking
//
//  Created by Greg Hepworth on 16/05/2020.
//  Copyright © 2020 Breakbeat Ltd. All rights reserved.
//

import Foundation
import FeedKit

class UserData: ObservableObject {
    
    @Published var bitpickingRSS: RSSFeed?
    
    
    init() {
        
        let bitpickingFeed = FeedParser(URL: URL(string: "https://anchor.fm/s/69da638/podcast/rss")!)
        let result = bitpickingFeed.parse()
        switch result {
            case .success(let feed):
            
            bitpickingRSS = feed.rssFeed
        
        case .failure(let error):
            print(error)
        }
        
    }
    
}
