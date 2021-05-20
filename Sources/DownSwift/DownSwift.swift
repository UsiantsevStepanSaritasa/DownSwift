//
//  DownSwift.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import UIKit

public final class DownSwift {
    private var textStyleAreas: [Character: [NSAttributedString.Key: Any]] = [:]
    private var regularStyleAttributes: [NSAttributedString.Key: Any] = [:]
    
    public init() {}
    
    /**
     Parses given string that has defined style areas with given config and returns attributed string.
     
     - Parameters:
       - string: String with defined text style areas.
     
     - Warning
     Text style areas have to be put consecutively in string: one after another. Don’t mix different text styles.
     */
    public func parse(_ string: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        for textArea in string.textAreas(config: textStyleAreas) {
            let currentAttributedString = NSMutableAttributedString(string: textArea.string)
            
            if let areaSymbol = textArea.areaSymbol, let attributes = textStyleAreas[areaSymbol] {
                currentAttributedString.addAttributes(attributes, range: NSMakeRange(0, currentAttributedString.length))
            } else {
                currentAttributedString.addAttributes(regularStyleAttributes, range: NSMakeRange(0, currentAttributedString.length))
            }

            attributedString.append(currentAttributedString)
        }
        
        return attributedString
    }
    
    /**
     Registers tag for text style area.
     
     - Parameters:
       - tag: `Character` that will be used for defining text areas.
       - attributes: A dictionary of attributes for `NSAttributedString` that will be applied to the text area which is specified by a given tag.
     
     If you need to define attributes for `regular` text style then place `nil` in `tag` parameter.
     */
    public func register(tag: Character?, attributes: [NSAttributedString.Key: Any]) {
        if tag == "\\" { return }
        
        if let tag = tag {
            textStyleAreas[tag] = attributes
        } else {
            regularStyleAttributes = attributes
        }
    }
}
