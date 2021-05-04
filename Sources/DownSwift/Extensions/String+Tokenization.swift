//
//  String+Tokenization.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

extension String {
    /// A function that is tokenizing given string.
    func textAreas() -> [Text] {
        /**
         A `Text` type optional property that stores current `Text`'s entity state.
         */
        var partialText: Text?
        
        /// A property that stores an array of `Text` entities.
        var textParts = [Text]()
        
        /// A boolean indicating if current character will be as a symbol within current text area
        var isSkipped = false
        
        /// A counter indicating if text area's open or closed.
        ///
        /// `areaCounter = 1` - text area is open;
        ///
        /// `areaCounter = 2` - text area is closed
        var areaCounter = 0
        
        /**
         Defines text area depending on character and then either add it to the existing text area or create new one.
         
         - parameter character: The character that we need to tokenize.
         */
        func tokenize(_ character: Character) {
            if var symbol = partialText {
                guard isLetter(character) || isSkipped else {
                    if character == TextStyle.symbol.rawValue, !isSkipped {
                        return isSkipped = true
                    } else {
                        areaCounter += 1
                        textParts.append(symbol)
                    }
                    
                    partialText = nil
                    
                    if areaCounter < 2 {
                        partialText = newTextArea(character)
                    } else {
                        areaCounter = 0
                    }
                    
                    return
                }
                
                symbol.string.append(character)
                partialText = symbol
                isSkipped = false
            } else {
                guard !isLetter(character) else { return partialText = newTextArea(character) }
                
                if character != TextStyle.symbol.rawValue {
                    areaCounter += 1
                    partialText = newTextArea(character)
                } else {
                    isSkipped = true
                    partialText = newTextArea(nil)
                }
            }
        }
        
        forEach(tokenize)
        
        if let lastSymbol = partialText, !lastSymbol.string.isEmpty {
            textParts.append(lastSymbol)
        }
        
        return textParts
    }
}

/// A function creates new Text entity depending on character.
///
/// - parameter character: The character that we need to tokenize.
private func newTextArea(_ character: Character?) -> Text {
    /* If character is not tokenizing at the moment and we meet special symbols
     then we define what specific zone of markdown we should parse.
     We're creating an empty Text entity, where we'll store our markdown zone.
     */
    switch character {
    case TextStyle.bold.rawValue:
        return Text(textStyle: TextStyle.bold, string: "")
    case TextStyle.italic.rawValue:
        return Text(textStyle: TextStyle.italic, string: "")
    case TextStyle.strikethrough.rawValue:
        return Text(textStyle: TextStyle.strikethrough, string: "")
    default:
        guard let character = character else {
            return Text(textStyle: TextStyle.regular, string: "")
        }
        return Text(textStyle: TextStyle.regular, string: "\(character)")
    }
}

/// A function checks if character is letter or text style area symbol.
///
/// - parameter character: The character that we need to check.
private func isLetter(_ character: Character) -> Bool {
    if
        character != TextStyle.bold.rawValue,
        character != TextStyle.italic.rawValue,
        character != TextStyle.strikethrough.rawValue,
        character != TextStyle.symbol.rawValue
    {
        return true
    } else {
        return false
    }
}
