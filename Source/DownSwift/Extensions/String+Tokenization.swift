//
//  String+Tokenization.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

extension String {
    /// A computed property that tokenizing given string.
    var symbols: [Text] {
        /**
         `Text` type optional property that stores current `Text`'s entity state.
         
         It's used for *bold*, *italic* and *strikethrough* text styles.
         
         - Warning
                For *regular* text style use `regularPartialText` property!
         */
        var partialText: Text?
        
        /**
         `Text` type optional property that stores current `Text`'s entity state for regular text style.
         
         It's used only for *regular* text style.
         
         - Warning
                For *bold*, *italic* and *strikethrough* text styles use `partialText` property!
         */
        var regularPartialText: Text?
        
        /// A property that stores an array of `Text` entities.
        var textParts = [Text]()
        
        /// A boolean property that indicates if character is tokenizing at current moment.
        var isTokenizing = false
        
        /**
            Defines text area depending on character and then either add it to the existing text area or create new one.
         
            - parameter character: The character that we need to tokenize.
         */
        func tokenize(_ character: Character) {
            if var symbol = partialText {
                guard
                    character != TextStyle.bold.rawValue,
                    character != TextStyle.italic.rawValue,
                    character != TextStyle.strikethrough.rawValue
                else {
                    // If we meet markdown symbol second time then we stop tokenizing, clear the partialSymbol and quit iteration
                    if
                        character == TextStyle.bold.rawValue ||
                        character == TextStyle.italic.rawValue ||
                        character == TextStyle.strikethrough.rawValue
                    {
                        textParts.append(symbol)
                        isTokenizing = false
                    } else if isTokenizing {
                        symbol.string.append(character)
                        return
                    }
                    
                    partialText = nil
                    return
                }
                
                symbol.string.append(character)
                partialText = symbol
            } else if var regularSymbol = regularPartialText {
                if
                    character != TextStyle.bold.rawValue,
                    character != TextStyle.italic.rawValue,
                    character != TextStyle.strikethrough.rawValue
                {
                    regularSymbol.string.append(character)
                    regularPartialText = regularSymbol
                } else {
                    regularPartialText = nil
                    textParts.append(regularSymbol)
                    switch character {
                    case TextStyle.bold.rawValue:
                        partialText = .bold("")
                        isTokenizing = true
                    case TextStyle.italic.rawValue:
                        partialText = .italic("")
                        isTokenizing = true
                    case TextStyle.strikethrough.rawValue:
                        partialText = .strikethrough("")
                        isTokenizing = true
                    default:
                        break
                    }
                }
            } else if !isTokenizing {
                /* If character is not tokenizing at the moment and we meet special symbols
                 then we define what specific zone of markdown we should parse.
                 We're creating an empty Text entity, where we'll store our markdown zone.
                 */
                switch character {
                case TextStyle.bold.rawValue:
                    partialText = .bold("")
                    isTokenizing = true
                case TextStyle.italic.rawValue:
                    partialText = .italic("")
                    isTokenizing = true
                case TextStyle.strikethrough.rawValue:
                    partialText = .strikethrough("")
                    isTokenizing = true
                default:
                    regularPartialText = .regular("\(character)")
                }
            }
        }
        
        forEach(tokenize)
        
        if let lastSymbol = partialText, !lastSymbol.string.isEmpty {
            textParts.append(lastSymbol)
        } else if let lastRegularSymbol = regularPartialText, !lastRegularSymbol.string.isEmpty {
            textParts.append(lastRegularSymbol)
        }
        
        return textParts
    }
}
