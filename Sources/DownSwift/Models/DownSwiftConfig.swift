//
//  MarkdownConfig.swift
//  DownSwift
//
//  Created by Stepan Usiantsev on 28.04.2021.
//

import UIKit

/**
 An entity for managing markdown's configuration.
 
 If you don't need any of the fields then you can skip them when declare `Config` entity. They will take default values if needed.
 
 # Fields
 - **regularFont**: A font object for regular style text (default value: `UIFont.systemFont(ofSize: 17)`);
 - **regularFontColor**: Color for regular style text (default value: `UIColor.black`);
 - **boldFont**: A font object for bold style text (default value: `UIFont.boldSystemFont(ofSize: 17)`);
 - **boldFontColor**: Color for bold style text (default value: `UIColor.black`);
 - **italicFont**: A font object for italic style text (default value: `UIFont.italicSystemFont(ofSize: 17)`);
 - **italicFontColor**: Color for italic style text (default value: `UIColor.black`);
 - **strikethroughFont**: A font object for strikethrough style text (default value: `UIFont.systemFont(ofSize: 17)`);
 - **strikethroughFontColor**: Color for strikethrough style text (default value: `UIColor.black`);
 - **strikethroughLineColor**: Color for strikethrough line (default value: `UIColor.black`).
*/
public struct DownSwiftConfig {
    var regularFont: UIFont
    var regularFontColor: UIColor
    var boldFont: UIFont
    var boldColor: UIColor
    var italicFont: UIFont
    var italicColor: UIColor
    var strikethroughFont: UIFont
    var strikethroughFontColor: UIColor
    var strikethroughLineColor: UIColor
    
    public init(
        regularFont: UIFont = .systemFont(ofSize: 17),
        regularFontColor: UIColor = .black,
        boldFont: UIFont = .boldSystemFont(ofSize: 17),
        boldColor: UIColor = .black,
        italicFont: UIFont = .italicSystemFont(ofSize: 17),
        italicColor: UIColor = .black,
        strikethroughFont: UIFont = .systemFont(ofSize: 17),
        strikethroughFontColor: UIColor = .black,
        strikethroughLineColor: UIColor = .black
    ) {
        self.regularFont = regularFont
        self.regularFontColor = regularFontColor
        self.boldFont = boldFont
        self.boldColor = boldColor
        self.italicFont = italicFont
        self.italicColor = italicColor
        self.strikethroughFont = strikethroughFont
        self.strikethroughFontColor = strikethroughFontColor
        self.strikethroughLineColor = strikethroughLineColor
    }
}
