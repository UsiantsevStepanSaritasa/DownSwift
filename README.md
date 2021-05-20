# DownSwift

[![Build Status](https://travis-ci.com/UsiantsevStepanSaritasa/DownSwift.svg?branch=main)](https://travis-ci.com/github/UsiantsevStepanSaritasa/DownSwift)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/UsiantsevStepanSaritasa/DownSwift/blob/main/LICENSE)
[![codebeat badge](https://codebeat.co/badges/ec58a535-56ab-4a53-b298-dde605e69a36?service=github)](https://codebeat.co/projects/github-com-usiantsevstepansaritasa-downswift-main)

Simple and lightweight Swift library that helps to define text style areas in given string with your own configuration, apply those styles and convert string into attributed string.

## Installation
### Using [CocoaPods](https://cocoapods.org):
```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'DownSwift'
end
```
Replace `YOUR_TARGET_NAME` and then, in the Podfile directory, type:
```
$ pod install
```
**Be careful with pod's version!** Sometimes CocoaPods can miss the latest version within default installation so there are solutions:
1. Run ```pod update``` in terminal within Podfile directory after pod's installation;

**OR**

2. Strictly define pod's version in Podfile:
```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
# Where '0.0.x' is a pod's version
    pod 'DownSwift', '~> 0.0.x'
end
```

### Using [Swift Package Manager](https://github.com/apple/swift-package-manager):
To add *DownSwift* to your project, select `File → Swift Packages → Add Package Dependency` and enter the GitHub URL for *DownSwift*. 

Check [Adding Package Dependencies to Your App](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) for detailed instructions.

## How to use
First of all, import library and initialize main class:
```swift
import DownSwift

class YourBeautifulClass {
    ...
    let downSwift = DownSwift()
    ...
}
```
Then create tags that will define text style areas in string:
```swift
    // EXAMPLE
    // For custom fonts I've used "Oswald-Regular" and "Oswald-Bold" fonts.
    ...
    // `*` tag will define bold style area
    downSwift.register(tag: "*", attributes: [
        NSAttributedString.Key.font: customBoldFont,
        NSAttributedString.Key.foregroundColor: UIColor.systemBlue
    ])
    // `~` tag will define italic style area
    downSwift.register(tag: "~", attributes: [
        NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 17),
        NSAttributedString.Key.foregroundColor: UIColor.systemRed
    ])
    // `|` tag will define strikethrough style area
    downSwift.register(tag: "|", attributes: [
        NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
        NSAttributedString.Key.strikethroughColor: UIColor.gray
    ])
    // To customize regular text style use `nil` in `tag` parameter!
    downSwift.register(tag: nil, attributes: [NSAttributedString.Key.font: customRegularFont])
    ...
```

If you want to **skip** any characters in your string then use `\\`.

After you created needed tags you can parse your string into attributed string with given style areas:
```swift
    let string = "Hello and *welcome* to the ~example area!~ We are |sad| ~happy\\*~ that you are *here*!!!"
    
    textLabel.attributedText = downSwift.parse(string)
```
Output:

![img](https://i.imgur.com/7cXZ3he.png?1)

## License
DownSwift is available under the MIT license. Check [LICENSE](https://github.com/UsiantsevStepanSaritasa/DownSwift/blob/main/LICENSE) file for more info.
