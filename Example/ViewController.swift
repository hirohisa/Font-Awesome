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

        // UIBarButtonItem
        let barButtonItem = UIBarButtonItem(fontAwesome: "f002", target: nil, action: nil)
        navigationItem.rightBarButtonItem = barButtonItem

        // UILabel
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 0, height: 0))
        label.font = UIFont.fontAwesome(size: 40)

        let icons = [
            String.fontAwesome(unicode: 0xf126),
            String.fontAwesome(unicode: 0xf092),
            String.fontAwesome(unicode: 0xf092),
            String.fontAwesome(unicode: 0xf092),
            String.fontAwesome(unicode: 0xf126),
        ]

        label.text = join(" ", icons)
        label.sizeToFit()
        view.addSubview(label)

        // UIButton
        let twButton = UIButton(frame: CGRect(x: 160, y: 300, width: 40, height: 40))
        twButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        twButton.setFontAwesome(fontAwesome: "f081", forState: .Normal)
        view.addSubview(twButton)

        let fbButton = UIButton(frame: CGRect(x: 200, y: 300, width: 40, height: 40))
        fbButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        fbButton.setFontAwesome(fontAwesome: "f082", forState: .Normal)
        view.addSubview(fbButton)

        let gpButton = UIButton(frame: CGRect(x: 240, y: 300, width: 40, height: 40))
        gpButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        gpButton.setFontAwesome(fontAwesome: "f0d4", forState: .Normal)
        view.addSubview(gpButton)

        // UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.center = view.center
        imageView.frame.offset(dx: 0, dy: 100)
        imageView.fontAwesome(fontAwesome: "f087")
        view.addSubview(imageView)

    }

}

