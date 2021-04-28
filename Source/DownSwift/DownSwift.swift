//
//  DownSwift.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import UIKit

final class DownSwift {
    /**
     Parses given string that has defined style areas with given config and returns attributed string.
     
     - Parameters:
     - string: String with defined text style areas.
     - config: An entity for managing markdown's configuration.
     
     - Warning
     Text style areas have to be put straight one after another in string. Don't mix different text styles.
     */
    public func parse(string: String, config: MarkdownConfig) -> NSAttributedString? {
        let attributedString = NSMutableAttributedString()
        let textAreas = string.symbols
        
        for textArea in textAreas {
            switch textArea.textStyle {
            case .regular:
                let currentAttributedString = NSMutableAttributedString(string: textArea.string)
                currentAttributedString.addConfigAttributes(with: config.regularFont, and: config.regularFontColor)
                
                attributedString.append(currentAttributedString)
            case .bold:
                let currentAttributedString = NSMutableAttributedString(string: textArea.string)
                currentAttributedString.addConfigAttributes(with: config.boldFont, and: config.boldColor)
                
                attributedString.append(currentAttributedString)
            case .italic:
                let currentAttributedString = NSMutableAttributedString(string: textArea.string)
                currentAttributedString.addConfigAttributes(with: config.italicFont, and: config.italicColor)
                
                attributedString.append(currentAttributedString)
            case .strikethrough:
                let currentAttributedString = NSMutableAttributedString(string: textArea.string)
                currentAttributedString.addConfigAttributes(
                    with: config.strikethroughFont,
                    and: config.strikethroughFontColor,
                    and: NSUnderlineStyle.single,
                    and: config.strikethroughLineColor
                )
                
                attributedString.append(currentAttributedString)
            }
        }
        
        return attributedString
    }
}
