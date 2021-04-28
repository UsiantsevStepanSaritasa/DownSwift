//
//  TextStyle.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

/**
 An entity of text styles that described by characters.
 
 # Styles
    - **regular**: A property for regular text style. Default value - "**`**" symbol;
    - **bold**: A property for bold text style. Default value - "*" symbol;
    - **italic**: A property for italic text style. Default value - "**~**" symbol;
    - **strikethrough**: A property for strikethrough text style. Default value - "**|**" symbol.
*/
public struct TextStyle: Equatable {
    var regular: Character
    var bold: Character
    var italic: Character
    var strikethrough: Character
    
    public init(
        regular: Character = "`",
        bold: Character = "*",
        italic: Character = "~",
        strikethrough: Character = "|"
    ) {
        self.regular = regular
        self.bold = bold
        self.italic = italic
        self.strikethrough = strikethrough
    }
}
