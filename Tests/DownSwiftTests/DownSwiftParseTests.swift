//
//  DownSwiftParseTests.swift
//  DownSwiftParseTests
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import XCTest
@testable import DownSwift

class DownSwiftParseTests: XCTestCase {
    let defaultTextStyle = TextStyle()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {

        try super.tearDownWithError()
    }
    
    func testOnlyRegularArea() {
        let string = "Hello and welcome to the test area!"
        let rightExpression = [Text(textStyle: defaultTextStyle.regular, string: "Hello and welcome to the test area!")]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing area with only regular style FAILED!")
    }

    func testOneBoldArea() {
        let string = "Hello and *welcome* to the test area!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.bold, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing one bold area FAILED!")
    }

    func testMultipleBoldAreas() {
        let string = "Hello and *welcome* to the *test area!* We are happy that you are *here*!!!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.bold, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.bold, string: "test area!"),
            Text(textStyle: defaultTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: defaultTextStyle.bold, string: "here"),
            Text(textStyle: defaultTextStyle.regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing multiple bold areas FAILED!")
    }

    func testOneItalicArea() {
        let string = "Hello and ~welcome~ to the test area!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.italic, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing one italic area FAILED!")
    }

    func testMultipleItalicAreas() {
        let string = "Hello and ~welcome~ to the ~test area!~ We are happy that you are ~here!!!~"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.italic, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.italic, string: "test area!"),
            Text(textStyle: defaultTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: defaultTextStyle.italic, string: "here!!!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing multiple italic areas FAILED!")
    }

    func testOneStrikethroughArea() {
        let string = "Hello and |welcome| to the test area!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the test area!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing one strikethrough area FAILED!")
    }

    func testMultipleStrikethroughAreas() {
        let string = "Hello and |welcome| to the |test area!| We are happy that you are |here|!!!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "test area!"),
            Text(textStyle: defaultTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "here"),
            Text(textStyle: defaultTextStyle.regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing multiple strikethrough areas FAILED!")
    }

    func testAllStylesWithOneAreaForEach() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!!"
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.bold, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.italic, string: "test area!"),
            Text(textStyle: defaultTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "here"),
            Text(textStyle: defaultTextStyle.regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing all styles with one area for each FAILED!")
    }

    func testAllStylesWithMultipleAreas() {
        let string = "Hello and *welcome* to the ~test area!~ We are happy that you are |here|!!! We *want* introduce you a ~big achievement~ but that's not *all*! We're also |a bit upset| that our *test* is ~coming~ to the ~end~ :("
        let rightExpression = [
            Text(textStyle: defaultTextStyle.regular, string: "Hello and "),
            Text(textStyle: defaultTextStyle.bold, string: "welcome"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.italic, string: "test area!"),
            Text(textStyle: defaultTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "here"),
            Text(textStyle: defaultTextStyle.regular, string: "!!! We "),

            Text(textStyle: defaultTextStyle.bold, string: "want"),
            Text(textStyle: defaultTextStyle.regular, string: " introduce you a "),
            Text(textStyle: defaultTextStyle.italic, string: "big achievement"),
            Text(textStyle: defaultTextStyle.regular, string: " but that's not "),
            Text(textStyle: defaultTextStyle.bold, string: "all"),

            Text(textStyle: defaultTextStyle.regular, string: "! We're also "),
            Text(textStyle: defaultTextStyle.strikethrough, string: "a bit upset"),
            Text(textStyle: defaultTextStyle.regular, string: " that our "),
            Text(textStyle: defaultTextStyle.bold, string: "test"),
            Text(textStyle: defaultTextStyle.regular, string: " is "),
            Text(textStyle: defaultTextStyle.italic, string: "coming"),
            Text(textStyle: defaultTextStyle.regular, string: " to the "),
            Text(textStyle: defaultTextStyle.italic, string: "end"),
            Text(textStyle: defaultTextStyle.regular, string: " :("),
        ]

        XCTAssertEqual(string.textAreas(textStyle: defaultTextStyle), rightExpression, "Tokenizing all styles with multiple areas for each FAILED!")
    }
    
    func testAllStylesWithCustomTextStyle() {
        let customTextStyle = TextStyle(regular: "|", bold: "#", italic: "$", strikethrough: "^")
        let string = "Hello and #welcome# to the $test area!$ We are happy that you are ^here^!!!"
        let rightExpression = [
            Text(textStyle: customTextStyle.regular, string: "Hello and "),
            Text(textStyle: customTextStyle.bold, string: "welcome"),
            Text(textStyle: customTextStyle.regular, string: " to the "),
            Text(textStyle: customTextStyle.italic, string: "test area!"),
            Text(textStyle: customTextStyle.regular, string: " We are happy that you are "),
            Text(textStyle: customTextStyle.strikethrough, string: "here"),
            Text(textStyle: customTextStyle.regular, string: "!!!")
        ]

        XCTAssertEqual(string.textAreas(textStyle: customTextStyle), rightExpression, "Tokenizing all styles with one area for each FAILED!")
    }
}
