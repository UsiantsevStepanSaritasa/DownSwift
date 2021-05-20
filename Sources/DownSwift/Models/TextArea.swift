//
//  TextArea.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

/**
 An entity that describes text area's content.
 # Fields
    - **areaSymbol**: A `Character` that defines text area style.
    - **string**:  This field contains text area's content.
 */
struct TextArea: Equatable {
    let areaSymbol: Character?
    var string: String
}
