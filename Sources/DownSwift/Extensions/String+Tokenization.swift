//
//  String+Tokenization.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import Foundation

extension String {
    /**
     A function that is tokenizing given string.
     
     - Parameters:
       - config: A dictionary that stores text styles.
     */
    func textAreas(config: [Character: [NSAttributedString.Key : Any]]) -> [TextArea] {
        /**
         `TextArea` type optional property that stores current `TextArea`'s entity state.
         */
        var partialText: TextArea?

        /// A property that stores an array of `TextArea` entities.
        var textParts = [TextArea]()

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
                guard isLetter(character, config) || isSkipped else {
                    if character == "\\", !isSkipped {
                        return isSkipped = true
                    } else {
                        areaCounter += 1
                        textParts.append(symbol)
                    }

                    partialText = nil

                    if areaCounter < 2 {
                        partialText = newTextArea(character, config)
                    } else {
                        areaCounter = 0
                    }

                    return
                }

                symbol.string.append(character)
                partialText = symbol
                isSkipped = false
            } else {
                guard !isLetter(character, config) else { return partialText = newTextArea(character, config) }

                if character != "\\" {
                    areaCounter += 1
                    partialText = newTextArea(character, config)
                } else {
                    isSkipped = true
                    partialText = newTextArea(nil, config)
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
/// - parameter config: A dictionary that stores text styles.
private func newTextArea(_ character: Character?, _ config: [Character: [NSAttributedString.Key : Any]]) -> TextArea {
    /* If character is not tokenizing at the moment and we meet special symbols
     then we define what specific zone of markdown we should parse.
     We're creating an empty Text entity, where we'll store our markdown zone.
     */
    if let character = character {
        return config[character] == nil ? TextArea(areaSymbol: nil, string: "\(character)") : TextArea(areaSymbol: character, string: "")
    } else {
        return TextArea(areaSymbol: nil, string: "")
    }
}

/// A function checks if character is letter or text style area symbol.
///
/// - parameter character: The character that we need to check.
/// - parameter config: A dictionary that stores text styles.
private func isLetter(_ character: Character, _ config: [Character: [NSAttributedString.Key: Any]]) -> Bool {
    if character == "\\" {
        return false
    } else {
        return !config.contains(where: { $0.key == character })
    }
}
