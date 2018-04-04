//
//  MovieService.swift
//  CodersSBTutorial
//
//  Created by Ricky Kuang on 2/20/18.
//  Copyright © 2018 Ricky Kuang. All rights reserved.
//

import Foundation

let linkString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json"

class MovieService {
    static let shared = MovieService()
    
    func getTopMovie(completion: @escaping (Movie)->()) {
        let url = URL(string: linkString)
        // optional chaining. nil checking :)
        if let unwrappedURL = url {
            let task = URLSession.shared.dataTask(with: unwrappedURL) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                            //                            print(json)
                            if let jsonDict = json as? [String : Any] {
                                if let movie = Movie(jsonDict: jsonDict) {
                                    DispatchQueue.main.async(execute: {
                                        completion(movie)
                                    })
                                }
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
