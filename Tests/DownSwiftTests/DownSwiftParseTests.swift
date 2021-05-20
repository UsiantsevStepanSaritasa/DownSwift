//
//  DownSwiftParseTests.swift
//  DownSwiftParseTests
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import XCTest
@testable import DownSwift

class DownSwiftParseTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {

        try super.tearDownWithError()
    }
    
    let boldAttr = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single] as [NSAttributedString.Key : Any]
    let italicAttr = [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 30), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single] as [NSAttributedString.Key : Any]
    let strikethroughAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single] as [NSAttributedString.Key : Any]
    
    func testOnlyRegularArea() {
        let string = "Hello and welcome to the test area!"
        let rightExpression = [TextArea(areaSymbol: nil, string: "Hello and welcome to the test area!")]

        XCTAssertEqual(string.textAreas(config: [:]), rightExpression, "Tokenizing area with only regular style FAILED!")
    }

    func testOneBoldArea() {
        let string = "Hello and *welcome* to the test area!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the test area!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing one bold area FAILED!")
    }

    func testMultipleBoldAreas() {
        let string = "Hello and *welcome* to the *test area!* We are happy that you are *here*!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "*", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "*", string: "here"),
            TextArea(areaSymbol: nil, string: "!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing multiple bold areas FAILED!")
    }

    func testOneItalicArea() {
        let string = "Hello and ~welcome~ to the test area!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "~", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the test area!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing one italic area FAILED!")
    }

    func testMultipleItalicAreas() {
        let string = "Hello and ~welcome~ to the ~test area!~ We are happy that you are ~here!!!~"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "~", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "~", string: "here!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing multiple italic areas FAILED!")
    }

    func testOneStrikethroughArea() {
        let string = "Hello and |welcome| to the test area!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "|", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the test area!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing one strikethrough area FAILED!")
    }

    func testMultipleStrikethroughAreas() {
        let string = "Hello and |welcome| to the |test area!| We are happy that you are |here|!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "|", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "|", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing multiple strikethrough areas FAILED!")
    }

    func testAllStylesWithOneAreaForEach() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing all styles with one area for each FAILED!")
    }

    func testAllStylesWithMultipleAreas() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!! We "),

            TextArea(areaSymbol: "*", string: "want"),
            TextArea(areaSymbol: nil, string: " introduce you a "),
            TextArea(areaSymbol: "~", string: "big achievement"),
            TextArea(areaSymbol: nil, string: " but that's not "),
            TextArea(areaSymbol: "*", string: "all"),

            TextArea(areaSymbol: nil, string: "! We're also "),
            TextArea(areaSymbol: "|", string: "a bit upset"),
            TextArea(areaSymbol: nil, string: " that our "),
            TextArea(areaSymbol: "*", string: "test"),
            TextArea(areaSymbol: nil, string: " is "),
            TextArea(areaSymbol: "~", string: "coming"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "end"),
            TextArea(areaSymbol: nil, string: " :("),
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing all styles with multiple areas for each FAILED!")
    }

    func testSymbolSkip() {
        let string = "Hello and *welcome\\** to the ~test \\~area!~ We are \\*happy that you are |here|!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "Hello and "),
            TextArea(areaSymbol: "*", string: "welcome*"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test ~area!"),
            TextArea(areaSymbol: nil, string: " We are *happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Symbol skip FAILED!")
    }

    func testAllStylesWithMultipleAreasWithCustomStart() {
        let string = "*Hello* and *welcome* to the ~test area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
        let rightExpression = [
            TextArea(areaSymbol: "*", string: "Hello"),
            TextArea(areaSymbol: nil, string: " and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test area!"),
            TextArea(areaSymbol: nil, string: " We are happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!! We "),

            TextArea(areaSymbol: "*", string: "want"),
            TextArea(areaSymbol: nil, string: " introduce you a "),
            TextArea(areaSymbol: "~", string: "big achievement"),
            TextArea(areaSymbol: nil, string: " but that's not "),
            TextArea(areaSymbol: "*", string: "all"),

            TextArea(areaSymbol: nil, string: "! We're also "),
            TextArea(areaSymbol: "|", string: "a bit upset"),
            TextArea(areaSymbol: nil, string: " that our "),
            TextArea(areaSymbol: "*", string: "test"),
            TextArea(areaSymbol: nil, string: " is "),
            TextArea(areaSymbol: "~", string: "coming"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "end"),
            TextArea(areaSymbol: nil, string: " :("),
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Tokenizing all styles with multiple areas for each FAILED!")
    }

    func testSymbolSkipAtTheStartOfString() {
        let string = "\\*Hello and *welcome\\** to the ~test \\~area!~ We are \\*happy that you are |here|!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "*Hello and "),
            TextArea(areaSymbol: "*", string: "welcome*"),
            TextArea(areaSymbol: nil, string: " to the "),
            TextArea(areaSymbol: "~", string: "test ~area!"),
            TextArea(areaSymbol: nil, string: " We are *happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Symbol skip at the start of sentence FAILED!")
    }

    func testSymbolAfterTextArea() {
        let string = "\\*Hello and *welcome*\\*\\* to the ~test \\~area!~\\* We are \\*happy that you are |here|\\*!!!"
        let rightExpression = [
            TextArea(areaSymbol: nil, string: "*Hello and "),
            TextArea(areaSymbol: "*", string: "welcome"),
            TextArea(areaSymbol: nil, string: "** to the "),
            TextArea(areaSymbol: "~", string: "test ~area!"),
            TextArea(areaSymbol: nil, string: "* We are *happy that you are "),
            TextArea(areaSymbol: "|", string: "here"),
            TextArea(areaSymbol: nil, string: "*!!!")
        ]
        let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]

        XCTAssertEqual(string.textAreas(config: testConfig), rightExpression, "Symbol skip after TextArea area FAILED!")
    }

    func testPerfomanceMeasure() {
        measure {
            let string = "*Hello* and \\**welcome* to the ~test \\~area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
            let array = Array(repeating: string, count: 100)
            let testConfig: [Character: [NSAttributedString.Key : Any]] = ["*": boldAttr, "~": italicAttr, "|": strikethroughAttr]
            
            for str in array {
                _ = str.textAreas(config: testConfig)
            }
        }
    }
}
