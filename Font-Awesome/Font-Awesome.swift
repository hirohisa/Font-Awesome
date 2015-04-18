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

protocol UnicodeLiteralConvertible {
    func convertToUnicode() -> String
}

extension String: UnicodeLiteralConvertible {

    func convertToUnicode() -> String {
        let scanner = NSScanner(string: self)
        var _unicode : UInt32 = 0
        if scanner.scanHexInt(&_unicode) {
            return String(UnicodeScalar(_unicode))
        }

        return self
    }
}

extension Int: UnicodeLiteralConvertible {

    func convertToUnicode() -> String {
        return String(UnicodeScalar(self))
    }
}

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

// Use Font Awesome

extension UIFont {
    class func fontAwesome(#size: CGFloat) -> UIFont {
        FontAwesome.load()
        return UIFont(name: "FontAwesome", size: size)!
    }
}

extension String {
    static func fontAwesome(unicode fontAwesome: UnicodeLiteralConvertible) -> String {
        return fontAwesome.convertToUnicode()
    }
}

// UIKit

extension UIImageView {

    func fontAwesome(#fontAwesome: UnicodeLiteralConvertible) {
        let _image = _fontAwesome(fontAwesome: fontAwesome)

        image = _image
    }

    private func _fontAwesome(#fontAwesome: UnicodeLiteralConvertible, color: UIColor = UIColor.blackColor()) -> UIImage {
        let unicode = fontAwesome.convertToUnicode()
        let font = UIFont.fontAwesome(size: frame.height)

        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)

        let textSize = unicode.sizeWithAttributes([NSFontAttributeName : font])
        let x = (bounds.width - textSize.width)/2
        let y = (bounds.height - textSize.height)/2
        let textRect = CGRect(x: x, y: y, width: textSize.width, height: textSize.height)

        let style = NSMutableParagraphStyle.defaultParagraphStyle()
        let attributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: color,
            NSParagraphStyleAttributeName: style
        ]
        unicode.drawInRect(textRect, withAttributes: attributes)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        return image
    }

}

extension UIButton {

    func setFontAwesome(#fontAwesome: UnicodeLiteralConvertible, forState state: UIControlState) {
        let title = fontAwesome.convertToUnicode()
        setTitle(title, forState: state)
        let font = UIFont.fontAwesome(size: frame.height - 4) // use 2point to padding
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
