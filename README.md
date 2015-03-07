# Font-Awesome [![license](https://img.shields.io/badge/license-MIT-000000.svg)](https://github.com/hirohisa/Font-Awesome/blob/master/LICENSE)

Use Font Awesome in project written in Swift. If you hope to use lastest edition, it is possible by `Font-Awesome`.

`Font-Awesome` supports the input with Unicode.

![ ](https://raw.github.com/hirohisa/Font-Awesome/master/Example/Example.png)

Requirements
----------

- iOS 7.0+
- Xcode 6.1

Installation
----------

1. Copy `Font-Awesome` directory into your project
2. Download zip file from https://fortawesome.github.io/Font-Awesome/
3. Copy `FontAwesome.otf` from zip file

Features
----------

- [x] Support Unicode from String or UInt.
- [ ] Support extension UIButton.
- [x] Support extension UIBarButtonItem
 

Usage
----------

1. Set UIFont with size

 ```swift
 let font = UIFont.fontAwesome(size: 40)
 ```

2. Set String with Unicode

 Use String or Int 
 ```swift
 String.fontAwesome(unicode: 0xf092) // UInt32
 String.fontAwesome(unicode: "f092") // String
 ```

Example
----------

- Use extension
 ```swift
 // UIBarButtonItem
 let barButtonItem = UIBarButtonItem(fontAwesome: "f002", target: nil, action: nil) // f002 = fa-search
 navigationItem.rightBarButtonItem = barButtonItem
 
 // UILabel
 let label = UILabel(frame: CGRect(x: 80, y: 200, width: 0, height: 0))
 label.font = UIFont.fontAwesome(size: 40)
 label.text = String.fontAwesome(unicode: 0xf092) // f092 = fa-github-square
 ```

LICENSE
-----------

Font-Awesome is available under the MIT license.

Credit
-----------

### Font Awesome
The Font Awesome webfont, CSS, and LESS files are licensed under CC BY 3.0. A mention of Font Awesome - http://fortawesome.github.com/Font-Awesome in human-readable source code is considered acceptable attribution (most common on the web). If human readable source code is not available to the end user, a mention in an 'About' or 'Credits' screen is considered acceptable (most common in desktop or mobile software).
