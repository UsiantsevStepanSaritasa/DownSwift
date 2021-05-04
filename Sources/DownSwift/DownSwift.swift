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
    public func parse(_ string: String, config: DownSwiftConfig = DownSwiftConfig()) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        for textArea in string.textAreas() {
            let currentAttributedString = NSMutableAttributedString(string: textArea.string)
            
            switch textArea.textStyle {
            case .regular:
                currentAttributedString.addConfigAttributes(configFont: config.regularFont, configColor: config.regularFontColor)
            case .bold:
                currentAttributedString.addConfigAttributes(configFont: config.boldFont, configColor: config.boldColor)
            case .italic:
                currentAttributedString.addConfigAttributes(configFont: config.italicFont, configColor: config.italicColor)
            case .strikethrough:
                currentAttributedString.addConfigAttributes(
                    configFont: config.strikethroughFont,
                    configColor: config.strikethroughFontColor,
                    strikethroughStyle: (NSUnderlineStyle.single, config.strikethroughLineColor)
                )
            default:
                break
            }

            attributedString.append(currentAttributedString)
        }
        
        return attributedString
    }
}
