//
//  UIImageView.swift
//  CodersSBTutorial
//
//  Created by Ricky Kuang on 4/3/18.
//  Copyright © 2018 Ricky Kuang. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageWithURL(urlString: String) {
        if let url = URL(string: urlString) {
            let imageTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async(execute: {
                                self.image = image
                            })
                        }
                    }
                }
            }
            imageTask.resume()
        }
    }
}
