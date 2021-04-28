//
//  DownSwift.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import UIKit

public final class DownSwift {
    public init() {}

    /**
     Parses given string that has defined style areas with given config and returns attributed string.
     
     - Parameters:
       - string: String with defined text style areas.
       - config: An entity for managing markdown's configuration.
       - textStyle: An entity of text styles that described by characters.
     
     - Warning
     Text style areas have to be put straight one after another in string. Don't mix different text styles.
     */
    public func parse(string: String, config: MarkdownConfig = MarkdownConfig(), textStyle: TextStyle = TextStyle()) -> NSAttributedString? {
        let attributedString = NSMutableAttributedString()
        let textAreas = string.textAreas(textStyle: textStyle)
        
        for textArea in textAreas {
            let currentAttributedString = NSMutableAttributedString(string: textArea.string)
            if  textArea.textStyle == textStyle.regular {
                currentAttributedString.addConfigAttributes(with: config.regularFont, and: config.regularFontColor)
            } else if textArea.textStyle == textStyle.bold {
                currentAttributedString.addConfigAttributes(with: config.boldFont, and: config.boldColor)
            } else if textArea.textStyle == textStyle.italic {
                currentAttributedString.addConfigAttributes(with: config.italicFont, and: config.italicColor)
            } else if textArea.textStyle == textStyle.strikethrough {
                currentAttributedString.addConfigAttributes(
                    with: config.strikethroughFont,
                    and: config.strikethroughFontColor,
                    and: NSUnderlineStyle.single,
                    and: config.strikethroughLineColor
                )
            }

            attributedString.append(currentAttributedString)
        }
        
        return attributedString
    }
}
