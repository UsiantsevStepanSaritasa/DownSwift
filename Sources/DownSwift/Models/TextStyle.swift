//
//  TextStyle.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

/**
  An enum for managing text style.
  
  # Cases
     - **regular**: A case for regular text style. Define regular area using "**`**" symbol;
     - **bold**: A case for bold text style. Define bold area using "*" symbol;
     - **italic**: A case for italic text style. Define italic area using "**~**" symbol;
     - **strikethrough**: A case for strikethrough text style. Define strikethrough area using "**|**" symbol.
     - **symbol**: A case for special symbols in text. Define symbol using "**\\**" symbol.
 */
enum TextStyle: Character {
    case regular = "`"
    case bold = "*"
    case italic = "~"
    case strikethrough = "|"
    case symbol = "\\"
}
