//
//  String+Tokenization.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

extension String {
    /// A computed property that's tokenizing given string.
    var textAreas: [Text] {
        /**
         `Text` type optional property that stores current `Text`'s entity state.
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
                guard
                    character != TextStyle.bold.rawValue,
                    character != TextStyle.italic.rawValue,
                    character != TextStyle.strikethrough.rawValue,
                    character != TextStyle.symbol.rawValue
                else {
                    // If we meet markdown symbol second time then we stop tokenizing, clear the partialSymbol and quit iteration
                    if
                        character == TextStyle.bold.rawValue ||
                        character == TextStyle.italic.rawValue ||
                        character == TextStyle.strikethrough.rawValue
                    {
                        if isSkipped {
                            symbol.string.append(character)
                            partialText = symbol
                            isSkipped = false
                            
                            return
                        }
                            
                        areaCounter += 1
                        textParts.append(symbol)
                    } else {
                        if character == TextStyle.symbol.rawValue, !isSkipped {
                            isSkipped = true
                            
                            return
                        } else if character == TextStyle.symbol.rawValue, isSkipped {
                            symbol.string.append(character)
                            partialText = symbol
                            isSkipped = false
                            
                            return
                        }
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
                partialText = newTextArea(character)
            }
        }
        
        forEach(tokenize)
        
        if let lastSymbol = partialText, !lastSymbol.string.isEmpty {
            textParts.append(lastSymbol)
        }
        
        return textParts
    }
}

private func newTextArea(_ character: Character) -> Text {
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
        return Text(textStyle: TextStyle.regular, string: "\(character)")
    }
}
