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
public struct MarkdownConfig {
    var regularFont: UIFont = .systemFont(ofSize: 17)
    var regularFontColor: UIColor = .black
    var boldFont: UIFont = .boldSystemFont(ofSize: 17)
    var boldColor: UIColor = .black
    var italicFont: UIFont = .italicSystemFont(ofSize: 17)
    var italicColor: UIColor = .black
    var strikethroughFont: UIFont = .systemFont(ofSize: 17)
    var strikethroughFontColor: UIColor = .black
    var strikethroughLineColor: UIColor = .black
}
