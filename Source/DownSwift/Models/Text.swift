//
//  Text.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

/**
 An entity that describes text area's content.
 # Fields
    - **textType**: A type of the text area;
    - **string**:  This field contains text area's content.
 */
struct Text: Equatable {
    let textStyle: TextStyle
    var string: String
}

extension Text {
    /**
        Returns `Text` entity with a *regular* text style with given string.
        - parameter string: Text area's content that will be given to the new `Text` entity.
     */
    static func regular(_ string: String) -> Text {
        return Text(textStyle: .regular, string: string)
    }
    
    /**
        Returns `Text` entity with a *bold* text style with given string.
        - parameter string: Text area's content that will be given to the new `Text` entity.
     */
    static func bold(_ string: String) -> Text {
        return Text(textStyle: .bold, string: string)
    }
    
    /**
        Returns `Text` entity with a *italic* text style with given string.
        - parameter string: Text area's content that will be given to the new `Text` entity.
     */
    static func italic(_ string: String) -> Text {
        return Text(textStyle: .italic, string: string)
    }
    
    /**
        Returns `Text` entity with a *striketrough* text style with given string.
        - parameter string: Text area's content that will be given to the new `Text` entity.
     */
    static func strikethrough(_ string: String) -> Text {
        return Text(textStyle: .strikethrough, string: string)
    }
}
