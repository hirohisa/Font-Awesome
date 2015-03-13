//
//  Font-Awesome.swift
//
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
        let font = UIFont.fontAwesome(size: frame.height - 2) // use 1point to padding
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