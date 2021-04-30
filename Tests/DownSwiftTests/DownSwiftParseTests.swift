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
    
    func testOnlyRegularArea() {
        let string = "Hello and welcome to the test area!"
        let rightExpression = [Text(textStyle: .regular, string: "Hello and welcome to the test area!")]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing area with only regular style FAILED!")
    }

    func testOneBoldArea() {
        let string = "Hello and *welcome* to the test area!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .bold, string: "welcome"),
            Text(textStyle: .regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing one bold area FAILED!")
    }

    func testMultipleBoldAreas() {
        let string = "Hello and *welcome* to the *test area!* We are happy that you are *here*!!!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .bold, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .bold, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .bold, string: "here"),
            Text(textStyle: .regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing multiple bold areas FAILED!")
    }

    func testOneItalicArea() {
        let string = "Hello and ~welcome~ to the test area!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .italic, string: "welcome"),
            Text(textStyle: .regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing one italic area FAILED!")
    }

    func testMultipleItalicAreas() {
        let string = "Hello and ~welcome~ to the ~test area!~ We are happy that you are ~here!!!~"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .italic, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .italic, string: "here!!!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing multiple italic areas FAILED!")
    }

    func testOneStrikethroughArea() {
        let string = "Hello and |welcome| to the test area!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .strikethrough, string: "welcome"),
            Text(textStyle: .regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing one strikethrough area FAILED!")
    }

    func testMultipleStrikethroughAreas() {
        let string = "Hello and |welcome| to the |test area!| We are happy that you are |here|!!!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .strikethrough, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .strikethrough, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .strikethrough, string: "here"),
            Text(textStyle: .regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing multiple strikethrough areas FAILED!")
    }

    func testAllStylesWithOneAreaForEach() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .bold, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .strikethrough, string: "here"),
            Text(textStyle: .regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing all styles with one area for each FAILED!")
    }

    func testAllStylesWithMultipleAreas() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .bold, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .strikethrough, string: "here"),
            Text(textStyle: .regular, string: "!!! We "),

            Text(textStyle: .bold, string: "want"),
            Text(textStyle: .regular, string: " introduce you a "),
            Text(textStyle: .italic, string: "big achievement"),
            Text(textStyle: .regular, string: " but that's not "),
            Text(textStyle: .bold, string: "all"),

            Text(textStyle: .regular, string: "! We're also "),
            Text(textStyle: .strikethrough, string: "a bit upset"),
            Text(textStyle: .regular, string: " that our "),
            Text(textStyle: .bold, string: "test"),
            Text(textStyle: .regular, string: " is "),
            Text(textStyle: .italic, string: "coming"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "end"),
            Text(textStyle: .regular, string: " :("),
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing all styles with multiple areas for each FAILED!")
    }
    
    func testSymbolSkip() {
        let string = "Hello and *welcome\\** to the ~test \\~area!~ We are \\*happy that you are |here|!!!"
        let rightExpression = [
            Text(textStyle: .regular, string: "Hello and "),
            Text(textStyle: .bold, string: "welcome*"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "test ~area!"),
            Text(textStyle: .regular, string: " We are *happy that you are "),
            Text(textStyle: .strikethrough, string: "here"),
            Text(textStyle: .regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Symbol skip FAILED!")
    }
    
    func testAllStylesWithMultipleAreasWithCustomStart() {
        let string = "*Hello* and *welcome* to the ~test area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
        let rightExpression = [
            Text(textStyle: .bold, string: "Hello"),
            Text(textStyle: .regular, string: " and "),
            Text(textStyle: .bold, string: "welcome"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "test area!"),
            Text(textStyle: .regular, string: " We are happy that you are "),
            Text(textStyle: .strikethrough, string: "here"),
            Text(textStyle: .regular, string: "!!! We "),

            Text(textStyle: .bold, string: "want"),
            Text(textStyle: .regular, string: " introduce you a "),
            Text(textStyle: .italic, string: "big achievement"),
            Text(textStyle: .regular, string: " but that's not "),
            Text(textStyle: .bold, string: "all"),

            Text(textStyle: .regular, string: "! We're also "),
            Text(textStyle: .strikethrough, string: "a bit upset"),
            Text(textStyle: .regular, string: " that our "),
            Text(textStyle: .bold, string: "test"),
            Text(textStyle: .regular, string: " is "),
            Text(textStyle: .italic, string: "coming"),
            Text(textStyle: .regular, string: " to the "),
            Text(textStyle: .italic, string: "end"),
            Text(textStyle: .regular, string: " :("),
        ]

        XCTAssertEqual(string.textAreas, rightExpression, "Tokenizing all styles with multiple areas for each FAILED!")
    }
}
