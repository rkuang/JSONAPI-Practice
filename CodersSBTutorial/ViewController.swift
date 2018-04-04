//
//  ViewController.swift
//  CodersSBTutorial
//
//  Created by Ricky Kuang on 2/20/18.
//  Copyright © 2018 Ricky Kuang. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyrightTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = "Movie Title"
        copyrightTextView.text = "Copyright Information"
        getTopMovie()
    }
    
    func getTopMovie() {
        MovieService.shared.getTopMovie { (movie) in
            self.titleLabel.text = movie.title
            self.copyrightTextView.text = movie.copyright
        }
    }
}

