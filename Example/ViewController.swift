//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 3/7/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 20, height: 20))
        label.font = UIFont.fontAwesome(size: 15)
        let string = String.fontAwesome(unicode: 0xf002)

        label.text = string
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

