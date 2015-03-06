//
//  Font-Awesome.swift
//  Font-Awesome
//
//  Created by Hirohisa Kawasaki on 3/7/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

class FontLoader {
    class func read(name: String) {
        let fontURL = NSBundle.mainBundle().URLForResource(name, withExtension: "otf")
        let data = NSData(contentsOfURL: fontURL!)!

        let provider = CGDataProviderCreateWithCFData(data)
        let font = CGFontCreateWithDataProvider(provider)!

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            println(error)
        }
    }
}

extension UIFont {

    class func fontAwesome(#size: CGFloat) -> UIFont {
        let name = "FontAwesome"
        if (UIFont.fontNamesForFamilyName(name).count == 0) {
            FontLoader.read(name)
        }

        return UIFont(name: name, size: size)!
    }
}

extension String {
    static func fontAwesome(#unicode: Int) -> String {
        return String(UnicodeScalar(unicode))
    }
}