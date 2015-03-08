//
//  Font-Awesome.swift
//  Font-Awesome
//
//  Created by Hirohisa Kawasaki on 3/7/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

class FontAwesome {

    struct Static {
        static var token : dispatch_once_t = 0
    }

    class func load() {
        dispatch_once(&Static.token) {
            FontManager.load("FontAwesome")
        }
    }

    class FontManager {
        class func load(fontName: String) {
            if (UIFont.fontNamesForFamilyName(fontName).count > 0) {
                return
            }

            let fontURL = NSBundle.mainBundle().URLForResource(fontName, withExtension: "otf")
            let data = NSData(contentsOfURL: fontURL!)!

            let provider = CGDataProviderCreateWithCFData(data)
            let font = CGFontCreateWithDataProvider(provider)!

            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                println(error)
            }
        }
    }
}

extension UIFont {
    class func fontAwesome(#size: CGFloat) -> UIFont {
        FontAwesome.load()
        return UIFont(name: "FontAwesome", size: size)!
    }
}

extension String {
    static func fontAwesome(#unicode: UInt32) -> String {
        return String(UnicodeScalar(unicode))
    }

    static func fontAwesome(#unicode: String) -> String {
        let scanner = NSScanner(string: unicode)
        var _unicode : UInt32 = 0
        if scanner.scanHexInt(&_unicode) {
            return String(UnicodeScalar(_unicode))
        }

        return unicode
    }
}

extension UIButton {

    func setFontAwesome(#fontAwesome: String, forState state: UIControlState) {
        let title = String.fontAwesome(unicode: fontAwesome)
        setTitle(title, forState: state)
        let font = UIFont.fontAwesome(size: titleLabel!.font.pointSize)
        titleLabel!.font = font
    }

}

public extension UIBarButtonItem {
    convenience init(fontAwesome: String, target: AnyObject?, action: Selector) {
        let title = String.fontAwesome(unicode: fontAwesome)
        self.init(title: title, style: .Plain, target: target, action: action)

        let font = UIFont.fontAwesome(size: 25)
        let attributes = [NSFontAttributeName: font]
        self.setTitleTextAttributes(attributes, forState: .Normal)
    }
}