//
//  Movie.swift
//  CodersSBTutorial
//
//  Created by Ricky Kuang on 2/20/18.
//  Copyright © 2018 Ricky Kuang. All rights reserved.
//

import Foundation
class Movie {
    var title: String
    var copyright: String
    var imageURL: String
    
    init() {
        title = ""
        copyright = ""
        imageURL = ""
    }
    
    init?(jsonDict: [String : Any]) {
        if let feedDict = jsonDict["feed"] as? [String : Any] {
            if let resultsDict = feedDict["results"] as? [[String : Any]] {
                let movieDict = resultsDict[0]
                guard let title = movieDict["name"] as? String,
                    let copyright = movieDict["copyright"] as? String,
                    let imageURL = movieDict["artworkUrl100"] as? String else {
                        return nil
                }
                self.title = title
                self.copyright = copyright
                self.imageURL = imageURL
                return
            }
        }
        return nil
    }
}
