# DownSwift

[![Build Status](https://travis-ci.com/UsiantsevStepanSaritasa/DownSwift.svg?branch=main)](https://travis-ci.com/github/UsiantsevStepanSaritasa/DownSwift)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/UsiantsevStepanSaritasa/DownSwift/blob/main/LICENSE)
[![codebeat badge](https://codebeat.co/badges/ec58a535-56ab-4a53-b298-dde605e69a36)](https://codebeat.co/projects/github-com-usiantsevstepansaritasa-downswift-main)

Simple and lightweight Swift library that helps to define text style areas in string with your own configuration, apply them and convert string into attributed string.

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
Then create text style areas in needed string using special symbols:

`*` - for **bold** style

`~` - for *italic* style

`|` - for ~~strikethrough~~ style

`\\` - for skipping special symbols that are mentioned above

### DownSwiftConfig default values:
```swift
  public init(
        regularFont: UIFont = .systemFont(ofSize: 17),
        regularFontColor: UIColor = .black,
        boldFont: UIFont = .boldSystemFont(ofSize: 17),
        boldColor: UIColor = .black,
        italicFont: UIFont = .italicSystemFont(ofSize: 17),
        italicColor: UIColor = .black,
        strikethroughFont: UIFont = .systemFont(ofSize: 17),
        strikethroughFontColor: UIColor = .black,
        strikethroughLineColor: UIColor = .black
    )
```

### Example (without custom text styles):
```swift
  let string = "Hello and *welcome* to the ~example area!~ We are |sad| ~happy\\*~ that you are *here*!!!"
  let attributedString = downSwift.parse(string)
  
  yourLabel.attributedText = attributedString
```
Output:

> Hello and **welcome** to the *example area!* We are ~~sad~~ *happy\** that you are **here**!!!

### Example (with custom text styles)
DownSwift allows you to customize font and font color for each of the styles. Also you can customize strikethrough line color!

You just need to create your own `DownSwiftConfig` entity.

You can customize any of given styles but you can also *skip* some properties if needed, in that case skipped properties will take values by default.

For example:
```swift
  let string = "Hello and *welcome* to the ~example area!~ We are |sad| ~happy\\*~ that you are *here*!!!"
  
  // For custom fonts you can use any UIFont. For colors use UIColor.
  // For this example I've used "Oswald-Regular" and "Oswald-Bold" fonts.
  let customConfig = DownSwiftConfig(
    regularFont: yourCustomRegularFont,
    boldFont: yourCustomBoldFont,
    boldColor: .systemBlue,
    italicColor: .systemRed,
    strikethroughLineColor: .gray
    )
  
  yourTextLabel.attributedText = downSwift.parse(string, config: customConfig)
```
Output:

![img](https://i.imgur.com/7cXZ3he.png?1)

## License
DownSwift is available under the MIT license. Check [LICENSE](https://github.com/UsiantsevStepanSaritasa/DownSwift/blob/main/LICENSE) file for more info.
