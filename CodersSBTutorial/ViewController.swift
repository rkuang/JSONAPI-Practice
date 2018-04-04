//
//  ViewController.swift
//  CodersSBTutorial
//
//  Created by Ricky Kuang on 2/20/18.
//  Copyright © 2018 Ricky Kuang. All rights reserved.
//

import UIKit
let randomString = "This isn't what you were expecting"
class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var copyrightTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = randomString
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

